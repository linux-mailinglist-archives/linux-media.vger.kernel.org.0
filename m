Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA97262F09
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 15:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgIINSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 09:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730356AbgIINRD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 09:17:03 -0400
Received: from coco.lan (ip5f5ad5d6.dynamic.kabel-deutschland.de [95.90.213.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 388DE21D7D;
        Wed,  9 Sep 2020 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599657395;
        bh=vh6ffIhwNMBP0liDh7X+NDCKMJdSwMNW5nstcXBKXD0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZlM9uFJGwjh8UQkS9oDF0EVo1xNs3gfZRlOgczczjVEUbT66UKNKvMIZigX4jdXls
         O5PPH6n86kJyNZF3ekyQ0CiJqW0ZQqyjAzL8lTt/UikaBA14tkjrcxXpkFmfPnbE1a
         yvirhWOhelCw9XSD6GZB+hcRe7+BF/TE6gK6UAlw=
Date:   Wed, 9 Sep 2020 15:16:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com
Subject: Re: [PATCH] media: camera-sensor.rst: fix a doc build warning
Message-ID: <20200909151630.3d66a8d2@coco.lan>
In-Reply-To: <c326774ad841b905c3b2925e5f8f509d29fb4c6f.1599656828.git.mchehab+huawei@kernel.org>
References: <c326774ad841b905c3b2925e5f8f509d29fb4c6f.1599656828.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  9 Sep 2020 15:07:11 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> 	Documentation/driver-api/media/camera-sensor.rst:123: WARNING: Inline literal start-string without end-string.

Please ignore this one. it is at the wrong place.

> 
> There's a missing blank line over there.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index bd81c2cc37f8..2a8889bf5046 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -127,6 +127,7 @@ after the power state transition has taken place. The ``s_ctrl``callback can be
>  used to obtain device's power state after the power state transition:
>  
>  .. c:function::
> +
>  	int pm_runtime_get_if_in_use(struct device *dev);
>  
>  The function returns a non-zero value if it succeeded getting the power count or



Thanks,
Mauro
