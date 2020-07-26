Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B14422DDC8
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGZJm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:42:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgGZJm2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:42:28 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A5992065C;
        Sun, 26 Jul 2020 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595756548;
        bh=xU3mIY5/hOHJA9Dae120zT2CM7tU7BcJpSsWowzvqcU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Lm4qRcFfX69sVvN8HloMzZSOCi0Ezg2P6d3048kP4DtpGl11HJxusW9XiM2YhG1Z7
         nOe9QBhlaD+gvKLOlmPPdYLbfkVxVTO2V0628CnUeQ2TTEgeT5bZkecaUA5I0L5G7h
         473Xm9s4iPMV22fPUrYd8YUCz+EUgJVrsnyMAEqU=
Date:   Sun, 26 Jul 2020 11:42:24 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] staging: media: atomisp: fix style of open brace
Message-ID: <20200726114224.1825a769@coco.lan>
In-Reply-To: <20200726090512.20574-2-bharadwaj.rohit8@gmail.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
        <20200726090512.20574-2-bharadwaj.rohit8@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 26 Jul 2020 14:35:12 +0530
Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com> escreveu:

> this patch fixes style of open brace after functions and if statements
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>

> @@ -119,8 +121,9 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
>  	blob = (const unsigned char *)fw + bi->blob.offset;
>  
>  	/* sanity check */
> -	if (bi->blob.size != bi->blob.text_size + bi->blob.icache_size + bi->blob.data_size + bi->blob.padding_size)
> -	{
> +	if (bi->blob.size !=
> +		bi->blob.text_size + bi->blob.icache_size +
> +		bi->blob.data_size + bi->blob.padding_size) {


Please adjust the alignments here. I'm pretty sure checkpatch --strict
will end complaining with the above, as the first line ends with "=".

I would, instead, code it as:

	if (bi->blob.size != bi->blob.text_size + bi->blob.icache_size +
			     bi->blob.data_size + bi->blob.padding_size) {


Thanks,
Mauro
