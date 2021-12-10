Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11FA46FAC4
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 07:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhLJGtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 01:49:32 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33974 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbhLJGt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 01:49:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 448E4B8236F
        for <linux-media@vger.kernel.org>; Fri, 10 Dec 2021 06:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C18C00446;
        Fri, 10 Dec 2021 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639118753;
        bh=JHb3yr0eY/b1PZdKEAXaykxlNi8jA220VVLTHAaMa0E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hOzW2Guig6VKSx8OvCpL2zVYP/E/tmX66LDEh81pWgZ0XIAmOPWLcSmaW4gpG0B37
         wcyRw03h6AAC4zru3WsUg8Pc9KwKKTM4smtV5P4XQzOFEEND/Q8RWjgMRah3hg56dg
         FL4gOaatPq5iVSq3YfRydp9wz2KLLfL98HPedTNmdVkOELvQPQ073hTXVSj6iMpr8B
         MKdLEBSIOy7ig+LK2I7dAcjIR0ezPBPbevM4tO+4wXUvYDdjdv6giBjXgul4GdF5zN
         +Rt5pV0BouIoBiyE0cRmT1b/qG/ZMi9OD3aPGQ7PiIdk27if6z/4mX+ndYeTf/pbJ3
         BAZEbNKCUMH2Q==
Date:   Fri, 10 Dec 2021 07:45:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: si2157: rework the firmware load logic
Message-ID: <20211210074546.6fcb7629@coco.lan>
In-Reply-To: <trinity-3624a17f-c00f-42f7-bb18-8e6235eb0e34-1639078649877@3c-app-gmx-bap23>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
        <842e61352a54e9f1a7f44c4e3250a055c2d45e13.1638958050.git.mchehab+huawei@kernel.org>
        <trinity-7e7d5b59-e213-481b-9b1b-ae9d0819a33c-1639003053723@3c-app-gmx-bap08>
        <20211209123422.054175cd@coco.lan>
        <trinity-3624a17f-c00f-42f7-bb18-8e6235eb0e34-1639078649877@3c-app-gmx-bap23>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 9 Dec 2021 20:37:29 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> > Not true. if you check the code for si2148, it doesn't have
> > an option to skip firmware load.  
> 
> You're right. I thought I had checked all code, but I must have
> missed that one.
> 
> Or I was distracted by the fact that for Si2148 with romid 0x33,
> a "dummy patch" is used, which according to the code comment
> skips the firmware download and boots from NVM only. So I suppose
> that version does not actually need the firmware...?!?

That's a good question. It sounds funny to have a "dummy patch"
loaded that would "skip firmware download", as the same would happen
without a firmware patch :-)

Hard to know for sure, but maybe the comment there was just outdated.
E. g. on a previous release it would have the code below such comment
also commented, but a new patch was then added, but someone forgot
to remove the comments.

> > I can't see a request_firmware_nowarn() function  
> 
> Sorry, it's:
> 
> EXPORT_SYMBOL_GPL(firmware_request_nowarn);

Ah ;-)

> They swapped the words around vs. the original function, for
> whatever reason. Anyway, please use "firmware_request_nowarn()"
> which does not log any message when the file is not found, so
> that only the message logged from the si2157 shows up in the
> kernel log.

Yeah, makes sense, especially since we'll be trying to load two
firmware files, at least for some of the tuners.

Thanks,
Mauro
