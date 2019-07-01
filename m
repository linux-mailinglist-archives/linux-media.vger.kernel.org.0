Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597045B841
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 11:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfGAJoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 05:44:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34966 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGAJoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 05:44:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id c6so15161423wml.0;
        Mon, 01 Jul 2019 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Wpl34t7pEEK79q3TGA4TYVX4j5sGst2FWPYV+cG9ZgQ=;
        b=FqCGWxP07Zk0mb9fi11yD9qbrg46ZxDMf6TAAhLTryUorNkAmjegD69qSKZQzKeIAn
         0s89ug6dEwg8L0+BEBBSAbCf3g7qTgsCUBh9aAp/nvNjGM8ZrPGOJ280HS1mn3PPt6Z7
         FkiCK9ryGXe48hSKSavf2BCdkAKZu00flMMqEcqN/jFRxbVO3clzXy/B8lAGQZUlUVDO
         n1l1VBVNK+FV3ZQJub7OuYXT9EBfLgwg2wubv9lMt4KR4F4cylnh2M6SjInEyoyQCXKW
         kc8jNbl3hlbq5zuOc2yJ9EOknAXMTPdnQNsJSJxTTDIFVtpvdh3rG4ZzuKYfGwhpSLPD
         afbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Wpl34t7pEEK79q3TGA4TYVX4j5sGst2FWPYV+cG9ZgQ=;
        b=j4HCLTnyg2ak2PqR5owt4JgNcxU4iNo7Ix6QVAS7OVSSaLOQOK4sz+bVo2UJ//QcJj
         j3+SMoam8dqSyg03PWDa17FLdFaqRccqKAAjwsEJIKRpeuyvLpn1zaLZLsxxCJZG1D5R
         deECgEK0OPeSS1rEizWuO6yitjBb3VymI3BXF7wke1ycbyp6NXoYmkVMphEcPpFh4ruG
         forTCuwdinihQn700P2+hF6Ri//qSaqg76DVlHGDoedY95/gDp5710QcNTZG2c7XJOU5
         05HMBTXXBt8di3WEy3giSa+kp5iKWnEtyDia1pqWuPhwk5Ea4Em6lx8L/Ww9w9NfFb31
         /Zng==
X-Gm-Message-State: APjAAAVHK20rQnuWOc2MrQzcN7HOMVLnSgRSqIicMDJySSb5wIprGCdd
        vpzNCMUegFUriIkTsJIhLevLLF7UUD8=
X-Google-Smtp-Source: APXvYqwE+Q7AnLDk4oMLFL/k5V2IsWF4NCm7kbDDvvTbUOZGjDlQHcN8+h+kh/QLkteSGPRbtaW/5w==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr17778545wme.51.1561974250603;
        Mon, 01 Jul 2019 02:44:10 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id f21sm9951878wmb.2.2019.07.01.02.44.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 02:44:09 -0700 (PDT)
References: <20190630034905.7124-1-chinmaya.mahesh@disroot.org>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Chinmaya Krishnan Mahesh <chinmaya.mahesh@disroot.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx7-media-csi: Remove unneeded break after return
In-reply-to: <20190630034905.7124-1-chinmaya.mahesh@disroot.org>
Date:   Mon, 01 Jul 2019 10:44:07 +0100
Message-ID: <m3o92egkd4.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chinmaya,
Thanks for your patch.

On Sun 30 Jun 2019 at 04:49, Chinmaya Krishnan Mahesh wrote:
> This patch fixes the checkpatch.pl warning:
>
> WARNING: break is not useful after a goto or return

but this is already fixed in the media subsystem tree, by a patch
from Fabio:

964fcacddf media: imx7-media-csi: Remove unneeded break

It is better to use that tree as reference for media fixes,
sometimes some are already fixed there.

Nevertheless many thanks for the patch.

---
Cheers,
	Rui


>
> Signed-off-by: Chinmaya Krishnan Mahesh <chinmaya.mahesh@disroot.org>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index a708a0340eb1..c15acca1dc0d 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1021,7 +1021,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>  		break;
>  	default:
>  		return -EINVAL;
> -		break;
>  	}
>  	return 0;
>  }

