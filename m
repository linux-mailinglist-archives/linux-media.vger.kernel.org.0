Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0E833A991
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 03:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCOCU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 22:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhCOCUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 22:20:09 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B03C061574;
        Sun, 14 Mar 2021 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=oSBpPf4bYMfKUou9mF2R93w1/aJ+4nGHZFxae5Y8G/k=; b=HLBvXxPdf/A1YL+kumi9e27nHw
        rws9PK0OcOwL/VtqxQkWGTrkaC4vxZXtM/dddDcbYZGVa739IdwsypFWP4nMMI7LhHzYtDTvYiIz9
        U5z5Wy9sf4okUv2azGU0hZPP+ylwDRVyWrLn3vKv+afumnwFxPT1nW1fphwlcYx6Q8ZnBfHB+xQi7
        HOaAzPi6x5zGzVPunUOFXDX0YcuAxSmw0xJcVQ9xUJ4vDz1KLBJiv6xMZGBRYcsCvmDNmItxeH/EO
        dKKslJIcjnzd3k7SUjIHVlOPkRy9gq3kQLcghiYXmirHsSvULAJ+mlB/DEjlT0x/KCzOwLfnU0XF0
        Pc5gSbtg==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lLcpx-001FLn-9D; Mon, 15 Mar 2021 02:20:06 +0000
Subject: Re: [PATCH] media: pci: saa7164: Rudimentary spelling fixes in the
 file saa7164-types.h
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210315013958.646798-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8da83e50-d228-ab1d-c078-80376f6319b0@infradead.org>
Date:   Sun, 14 Mar 2021 19:20:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315013958.646798-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/14/21 6:39 PM, Bhaskar Chowdhury wrote:
> 
> s/structues/structures/
> s/decies/decides/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  drivers/media/pci/saa7164/saa7164-types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-types.h b/drivers/media/pci/saa7164/saa7164-types.h
> index 34dd2be6fce4..00f163b38d40 100644
> --- a/drivers/media/pci/saa7164/saa7164-types.h
> +++ b/drivers/media/pci/saa7164/saa7164-types.h
> @@ -7,7 +7,7 @@
> 
>  /* TODO: Cleanup and shorten the namespace */
> 
> -/* Some structues are passed directly to/from the firmware and
> +/* Some structures are passed directly to/from the firmware and
>   * have strict alignment requirements. This is one of them.
>   */
>  struct tmComResHWDescr {
> @@ -28,7 +28,7 @@ struct tmComResHWDescr {
>  /* This is DWORD aligned on windows but I can't find the right
>   * gcc syntax to match the binary data from the device.
>   * I've manually padded with Reserved[3] bytes to match the hardware,
> - * but this could break if GCC decies to pack in a different way.
> + * but this could break if GCC decides to pack in a different way.
>   */
>  struct tmComResInterfaceDescr {
>  	u8	bLength;
> --


-- 
~Randy

