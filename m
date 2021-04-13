Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5946E35DC3D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhDMKLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:11:20 -0400
Received: from iodev.co.uk ([46.30.189.100]:49672 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229835AbhDMKLQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:11:16 -0400
X-Greylist: delayed 530 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Apr 2021 06:11:16 EDT
Received: from pirotess (121.130.77.188.dynamic.jazztel.es [188.77.130.121])
        by iodev.co.uk (Postfix) with ESMTPSA id D855529DF3;
        Tue, 13 Apr 2021 12:02:03 +0200 (CEST)
Date:   Tue, 13 Apr 2021 12:02:28 +0200
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey_utkin@fastmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: solo6x10: remove useless function
Message-ID: <20210413100228.GC27272@pirotess>
References: <1618298581-33566-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618298581-33566-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

NACK; before removing any of these functions the fields should be
documented somewhere else, so that no information is lost.

On 13/Apr/2021 15:23, Jiapeng Chong wrote:
> Fix the following clang warning:
> 
> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:394:19: warning: unused
> function 'vop_interlaced' [-Wunused-function].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> index 0abcad4..8c4fae7 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> @@ -391,11 +391,6 @@ static int solo_send_desc(struct solo_enc_dev *solo_enc, int skip,
>  }
>  
>  /* Extract values from VOP header - VE_STATUSxx */
> -static inline int vop_interlaced(const vop_header *vh)
> -{
> -	return (__le32_to_cpu((*vh)[0]) >> 30) & 1;
> -}
> -
>  static inline u8 vop_channel(const vop_header *vh)
>  {
>  	return (__le32_to_cpu((*vh)[0]) >> 24) & 0x1F;
> -- 
> 1.8.3.1
> 

-- 
Ismael Luceno
http://iodev.co.uk/
