Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5852C39B2BF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 08:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDGl4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 02:41:56 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34409 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229826AbhFDGl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 02:41:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p3UxlRBKBhg8Zp3V1lzfbX; Fri, 04 Jun 2021 08:40:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622788809; bh=fY6HqtHQ/Kh9hmacobyoAZhk3pc283l0lae92wfeQN0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YiVrYHQv4eZf2BPkA/ac+S/VDqoR7WHnohQEpVGEXXo2Go7bpFYJ9WH1bFX1sj0x3
         tCkLYTsrsRCL478gEblF3S9hjnAjMFFuKxPnDPw5ClIh1TJ7/EEuVlttCjkiIREcaZ
         OBl16JzZjPxhtkyj+FF1Aoi9PEp4FXGPAFTSKKyCgt4EAjue5hERCKzlE5atKfJbWB
         elCDOYd3OTb0XKDQj8qNZwxLXw18AGIrwcZT9ynw/kNvgtMSrp/8YoptDtWjGkmx1/
         jRaB6KyggsxENvq2EidcX/qS6MyiVDtXpcu7VdVMHMPMBVRtRqfcGH7AaaVLJaaFG7
         UaSFuaxZ7kICw==
Subject: Re: [PATCH] Signed-off-by: Herman <yanshuaijun@yulong.com>
To:     Herman <herman.yim88@gmail.com>, mchehab@kernel.org
Cc:     anton@corp.bluecherry.net, andrey.utkin@corp.bluecherry.net,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        maintainers@bluecherrydvr.com, Herman <yanshuaijun@yulong.com>
References: <20210604035246.1260-1-yanshuaijun@yulong.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <12883fa2-8de4-0807-556c-8a71d82ba4ae@xs4all.nl>
Date:   Fri, 4 Jun 2021 08:40:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604035246.1260-1-yanshuaijun@yulong.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHNvcwBJTxqs95HYgC2J9yUVOv/MEXxaqvqlC5uXAm7fVs/pxGbWRYAD//SyaI+xSCySwQZg7mbSpBvZQYmhRcmk27FdRxI8tyqpXXm8YzfBRfjv0tF6
 zu3IiMyaYEH4ioI4ppYEGMbzqNYsvrkpswSX3Z3NOXp9T0cAcDhGwO1tzwIgQLdB/vrE/caqbOD434R63Fku5NJHeKhMhpbr0PU24B4kn1bbiJF8JVkWwOGo
 2ilYNbYfllgNFnGvisbWBcjv6eY84enTT7ZrhQoe/occwjZ+Z1M8KMiTm8RHyvWdAvwQ/I81kA/8/ql/fZEeHcsMhzoOOA983kcXWs6esMacn9hSVyfsLVBc
 B+lVY4GTK5q2P1bRgZbnZT0hvUL2nRod404LICADVtmb4qxvh7QioqolDjF0HoAcHFPDn1hcKaPFepYE/PV2oCVOg/4SQIq3E+/tRiCyUgnCF3G4lgaPtUho
 Vq18Hrgq8bSX2z81
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Herman,

Your subject line is mangled (has your Signed-off-by instead of a proper subject).

On 04/06/2021 05:52, Herman wrote:
> drivers/media/pci/tw5864/Tw5864-reg.h: fix typo issues
> 
> change 'syncrous ' into 'synchrous '

I think this should be 'synchronous'.

Regards,

	Hans

> 
> Signed-off-by: Herman <yanshuaijun@yulong.com>
> ---
>  drivers/media/pci/tw5864/tw5864-reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/tw5864/tw5864-reg.h b/drivers/media/pci/tw5864/tw5864-reg.h
> index a74f30f2f78e..2dd4413359df 100644
> --- a/drivers/media/pci/tw5864/tw5864-reg.h
> +++ b/drivers/media/pci/tw5864/tw5864-reg.h
> @@ -663,7 +663,7 @@
>  #define TW5864_SYNC 0x8008
>  /* Define controls in register TW5864_SYNC */
>  /*
> - * 0 vlc stream to syncrous port
> + * 0 vlc stream to synchrous port
>   * 1 vlc stream to ddr buffers
>   */
>  #define TW5864_SYNC_CFG BIT(7)
> 

