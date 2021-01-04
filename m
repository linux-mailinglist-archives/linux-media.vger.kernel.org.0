Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D30B2E9425
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 12:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbhADLfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 06:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbhADLfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 06:35:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54291C061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 03:35:01 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m25so63480871lfc.11
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 03:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ezrAZiib5472CXJ4f6df56J+hETWOi2awErmiq2BU8U=;
        b=EuN8Tk+wllgfwcaMB0OWQiI2IzFt36TiXGU/S1Q0c2flOUPnq+PMokuv79illT0ezC
         w3kddu2yG1Zqo+TJ45+WK5ho2Gh4jCJ4u0eFoD3quXm60w8RGpi7RMRHBKWvVx+2+Pfr
         YCzvIoXU7nK0lCN/4SZ1FghSPKzh56RutpvUsf5KnPkjulaUdjJmtwRi6yjkYxgZb12o
         GJuY6Wx3d0osA05KN8xPP7BlH0hN2qFECtVX160cdaksrDU7VvZNktYoGVxNFCwgesTw
         UWOEC59Cb6aHnCEIyWVSq6W2/tlOAXCCMuy7ldUOeXgkNx44IU/oxCulkm1vCkVWlQPp
         as4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ezrAZiib5472CXJ4f6df56J+hETWOi2awErmiq2BU8U=;
        b=sJphgJBb/wbvwmF1Wpol4Go+R2HUwAadALw9FlkeDhDR7n2e/aeCztm7FNFKWm/gSE
         k/u2lzSUSDYokbZU4wPtHCXaUUtHMteruLsIF6IDT/xkEKjLkakR9aq6X14Ekp+OKaTX
         u+0EGKC1fY6piiWi8/R8Gj6M49kXTHldWS+a8f19zubBRql/Ag1zDirodCV43tkqe/Hz
         jZLnZJMtskHIC883NusK1av5AHJyv+ymk3EFobS3xrMvP6q5a/BjULnBWPvd8Sdqzs4N
         7dsp2l5i5Ieo98dvw3N5wlBzFdbuk3bFAN8eZCKdxnsgVLIHrbD68SKkzo9JuZG4emq0
         24+w==
X-Gm-Message-State: AOAM531KoAByD7imSDRdLLdY+dd0tqhtIaOtq/6wGFaXETsj/zIbg53t
        uYLI/v0fupAxHfLatHUkETqyaCUE3aqZ66AvsqA=
X-Google-Smtp-Source: ABdhPJyq22gwZ/CiIZuEglh4lh6aIkOpWN2Nj6q6iwLf+p4rBHbRG/8W9Xq2EKMR0uo97siHiqKdygqj7+Gl0sZ8F6k=
X-Received: by 2002:a19:d93:: with SMTP id 141mr33047308lfn.229.1609760099850;
 Mon, 04 Jan 2021 03:34:59 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
In-Reply-To: <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 4 Jan 2021 08:34:48 -0300
Message-ID: <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your comments.

On Mon, Jan 4, 2021 at 3:05 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> That's not right, csi->is_csi2 is a flag that indicates if the current
> input to the CSI comes from the CSI-2 receiver.
>
> It looks like the i.MX6ULL is missing the MIPI CSI-2 receiver and thus
> also the corresponding video mux. The WARN_ON() should thus indeed by
> bypassed, but only for devices that don't have the video mux. I wouldn't

Unlike i.MX7, i.MX6UL/i.MX6ULL do not have a MIPI CSI-2 IP block.

They only have a parallel CSI interface, and no video mux is present.

So the csi->is_csi2 check I did seems correct, right?

> be surprised if other adaptations would be needed in the code.

Yes, I found other paths that miss the csi->is_csi2 check too.

Thanks,

Fabio Estevam
