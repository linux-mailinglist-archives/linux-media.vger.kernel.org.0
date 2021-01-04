Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77B32E9644
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbhADNp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbhADNpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 08:45:55 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D52FC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 05:45:15 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d26so32162257wrb.12
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8PFJxD9EuAJxss08z7wCYMAluBjMuZ4kdcsx99I6T3Y=;
        b=BVYgTjXgRb64jxlSDdabHZCcJBbSwp1ClIvZqS0dLm3iDX5Ljyg3fJuNQIeZM71Zzo
         bafssT5b+HiT0MzA7CkQgpEpxrfTu5vMudgY2qCpSTcYaV13iFhfXJKRVN1h4VbMygcB
         y4pTzyvu0B7zKYn+jC3PH8d5rwJfcvBzvVsSbrIe672wga/I9b47Ry/iymnTb2rp3tQ+
         CIOwf2+UMa8421GZF5RgZ/Wa0QrQ359KXj2H+dmQi9XHiu2x0zoVFnnBssikTb+viJPa
         itknlMpzGUYKmWu+WIjIMzOEn/v5NuzJC0ix/3saA5nqa3r07fydgJJT6y7hbCqp6CCl
         ffuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8PFJxD9EuAJxss08z7wCYMAluBjMuZ4kdcsx99I6T3Y=;
        b=Iqq4p/mTPKRtScecj+DGUf1xKpyeZ9Pte36uca9ukSichDxHpwFRA7C5th0trrfYrl
         XkoLkIoanKD4BFzKZ/NfhC7zfgsZHl5PdoTYad15rGBZfv1DHWtiKiGduNz1rNSYuO1k
         9ZfwrrvGTIYkk3YxFvNiBLUrHDWXSlG8KIbU+GIHfBfp/PYbtLNZ29t3PbjQmVnwqY1U
         OKg490nO1c6/cfJxHUBImDh8MhTIty9xh6FTTCnq1arnRiWUQkefaUCSVZkOIP15Ccdk
         7atPy2vj6AvVmzv7giLm7/jT1b78DJuQKClZ3vMgf9UiK2HJa2IxOTKp70c/r5Ta238d
         mg6w==
X-Gm-Message-State: AOAM5328FbRhOWVVMJ7LBk/fbRgMeimBoyM+keemXRXvQLdOkZgUgP6z
        cQmSsJ9IA6FZL2qY7sCThKU=
X-Google-Smtp-Source: ABdhPJx9pNrvWH6f9RgTV29/4mI6rxb6K+ujKpIE7z1ddUo8LUExXE3x9YsK0xJQ3bcz9gDCETGf9Q==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr79184572wrv.93.1609767913941;
        Mon, 04 Jan 2021 05:45:13 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j9sm91119763wrm.14.2021.01.04.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 05:45:13 -0800 (PST)
Date:   Mon, 4 Jan 2021 13:45:11 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
 <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
 <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
catching up with this thread.

On Mon, Jan 04, 2021 at 03:08:58PM +0200, Laurent Pinchart wrote:
> Hi Fabio,
> 
> On Mon, Jan 04, 2021 at 08:34:48AM -0300, Fabio Estevam wrote:
> > On Mon, Jan 4, 2021 at 3:05 AM Laurent Pinchart wrote:
> > 
> > > That's not right, csi->is_csi2 is a flag that indicates if the
> > > current input to the CSI comes from the CSI-2 receiver.
> > >
> > > It looks like the i.MX6ULL is missing the MIPI CSI-2 receiver
> > > and thus also the corresponding video mux. The WARN_ON() should
> > > thus indeed by bypassed, but only for devices that don't have
> > > the video mux. I wouldn't
> > 
> > Unlike i.MX7, i.MX6UL/i.MX6ULL do not have a MIPI CSI-2 IP block.
> > 
> > They only have a parallel CSI interface, and no video mux is
> > present.
> > 
> > So the csi->is_csi2 check I did seems correct, right?
> 
> I don't think so. csi->is_csi2 tells if the currently selected input
> of the video mux is the CSI-2 receiver, not if there's a CSI-2
> receiver present in the device. csi->is_csi2 should of course always
> be false when there's no CSI-2 receiver, but it can be false when a
> CSI-2 receiver is present and the currently selected input is the
> parallel input.

Laurent is correct here. That flag indicates if CSI-2 is the selected
input for the video mux.

> 
> > > be surprised if other adaptations would be needed in the code.

I really only had the warp7 board which only had the csi2 as video mux
input, never got the chance to test it with a parallel input. And the
driver expects that we always have a mux. I was not even aware that an
imx6 would have the same csi ip.

but from the error outputs looks issues getting the format around the
imx7_csi_{try, get}_fmt.

------ 
Cheers, 
    Rui

> > 
> > Yes, I found other paths that miss the csi->is_csi2 check too.
> 
> -- Regards,
> 
> Laurent Pinchart
