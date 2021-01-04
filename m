Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557B22E96BF
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 15:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbhADOF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 09:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbhADOF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 09:05:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA52DC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 06:05:15 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g185so19422060wmf.3
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qI9pgI8QN03NxyaYrEoFCjNEpXaU69KlxstEMnwn+Gs=;
        b=VgYsXIax45+75N/IMLP8SUzWZdkBOd7k3XfvjdHDU58J/0jMSxosFHyeU386QiKK/0
         jCVzWlWb1gXz4VdU7d7z7IK+NMZeybAfTKRJ2BtghldTwpyT0Hc7y4pWeR95EseaEnF+
         eg7br5qbZ3/dBaDPG6slyEDNpV2rhRk2SzUS/nT9lPVjDQ2CoT6i76FZ6w3UPfLZE/3r
         4ALxOJq8t/hJ7KgUeG3ro/MZEe/eCkL20MhZseES0igaSGEGoV4zsv/qjQXCzaLXUgt1
         IZJFN4nTk3DlurDmZkifn8p22fx+jYfsGGy+2B+bu1kMXDZDne5gJV3/DVXUAqYxadrf
         pjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qI9pgI8QN03NxyaYrEoFCjNEpXaU69KlxstEMnwn+Gs=;
        b=jHQPQMPC+71qALa6Wn9o6l9/sxCUokbR7FTox87uqKG3qOHFyr7Gktl3af4CnkC+eD
         93L/AjYBMOX4jQEPv+CmNstlkjFqPsVGg8w300m6XtzwaeGF48/YvX3cmtr/gacKAH6q
         P1jVfRWKy5oVYT1xOjMj8dUU/Iah8sEpXSiLLHiZHOF02FT+xoUSCUAvxhHsVCQ+5JbG
         z9R/EMB20FuDZTkzHGc6utT7HL5FQFmmfRMdnDw5Zl6lNcntj5Pqxg043EximzYT05zK
         4kWIH6OJHVs5BgjtpsnnubBPuefSTf9a2McXfSdeUrNGT70Aw70dkFwrVJvUZEEC13yW
         wLDg==
X-Gm-Message-State: AOAM530j21CAkEfEw09WKS0kIPLonwhRJ5om8ZmGzKVwBttjCUF6+EFZ
        MSexjLqswfAFzIUgyuoz2lA=
X-Google-Smtp-Source: ABdhPJyvWioy0CATmPLUIenotXRwki0oluHceGjj9wnfR9SERV+XX3kEgseplKYCUyQXgUUgy7K9tA==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr27331294wme.188.1609769114470;
        Mon, 04 Jan 2021 06:05:14 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id u13sm92826286wrw.11.2021.01.04.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 06:05:13 -0800 (PST)
Date:   Mon, 4 Jan 2021 14:05:11 +0000
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
Message-ID: <20210104140511.ao7dprd5adpvut4m@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
 <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
 <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
 <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
 <X/MdDzJUqTDSbupS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/MdDzJUqTDSbupS@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Mon, Jan 04, 2021 at 03:50:07PM +0200, Laurent Pinchart wrote:
> Hi Rui,
> 
> On Mon, Jan 04, 2021 at 01:45:11PM +0000, Rui Miguel Silva wrote:
> > Hi, catching up with this thread.
> > 
> > On Mon, Jan 04, 2021 at 03:08:58PM +0200, Laurent Pinchart wrote:
> > > On Mon, Jan 04, 2021 at 08:34:48AM -0300, Fabio Estevam wrote:
> > > > On Mon, Jan 4, 2021 at 3:05 AM Laurent Pinchart wrote:
> > > > 
> > > > > That's not right, csi->is_csi2 is a flag that indicates if
> > > > > the current input to the CSI comes from the CSI-2 receiver.
> > > > >
> > > > > It looks like the i.MX6ULL is missing the MIPI CSI-2
> > > > > receiver and thus also the corresponding video mux. The
> > > > > WARN_ON() should thus indeed by bypassed, but only for
> > > > > devices that don't have the video mux. I wouldn't
> > > > 
> > > > Unlike i.MX7, i.MX6UL/i.MX6ULL do not have a MIPI CSI-2 IP
> > > > block.
> > > > 
> > > > They only have a parallel CSI interface, and no video mux is
> > > > present.
> > > > 
> > > > So the csi->is_csi2 check I did seems correct, right?
> > > 
> > > I don't think so. csi->is_csi2 tells if the currently selected
> > > input of the video mux is the CSI-2 receiver, not if there's a
> > > CSI-2 receiver present in the device. csi->is_csi2 should of
> > > course always be false when there's no CSI-2 receiver, but it
> > > can be false when a CSI-2 receiver is present and the currently
> > > selected input is the parallel input.
> > 
> > Laurent is correct here. That flag indicates if CSI-2 is the
> > selected input for the video mux.
> > 
> > > > > be surprised if other adaptations would be needed in the
> > > > > code.
> > 
> > I really only had the warp7 board which only had the csi2 as video
> > mux input, never got the chance to test it with a parallel input.
> > And the driver expects that we always have a mux. I was not even
> > aware that an imx6 would have the same csi ip.
> > 
> > but from the error outputs looks issues getting the format around
> > the imx7_csi_{try, get}_fmt.
> 
> Do you still have the hardware, would you be able to test a patch
> series ?

Yeah, I have it somewhere... it could take a couple of days to
restore the setup, but possible for sure.

------
Cheers,
     Rui

> 
> > > > Yes, I found other paths that miss the csi->is_csi2 check too.
> 
> -- Regards,
> 
> Laurent Pinchart
