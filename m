Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3F565E601
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 08:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjAEHXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 02:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjAEHXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 02:23:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0EA4883A
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 23:23:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D1C049C;
        Thu,  5 Jan 2023 08:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672903417;
        bh=9Jug5JK/wqmTIoBwxAQ9kjzVMp4vIGbHqXMGwps/bjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T56p55P6vyt7h92m0+mtMaWSEzzz2cgCe6/PnDbNqE55t+EfDmuTvvygHyftJn9fl
         RopMGNdvcYSZTJIrhMJQAfBg+8w2bHioSMlfL33dhfN3zQ3XisvXwxgdmRgs87Zc9h
         uPOA7fvWj54ugjMXQhoCm7rC6W2wZUTQbDEua9+s=
Date:   Thu, 5 Jan 2023 09:23:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
Message-ID: <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com>
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
 <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 04, 2023 at 02:12:44PM +0100, Ricardo Ribalda wrote:
> Hi Jiri
> 
> 
> 
> I think that /dev/video3 belongs to your notebook webcam, not to the EasyCAP.

That looks correct.

> 720x480 I believe is the NTSC resolution. Can you try starting the
> VHS, *before* you connect the grabber to the USB? Maybe that way the
> device realises that it should be working in PAL not in NTSC.

Good idea. The device advertises a maximum resolution of 720x480 in the
UVC descriptors it exposes to the host, so there's nothing the driver
can really do to obtain 720x576.

If plugging an active PAL source to the device before plugging it to the
USB port doesn't help, another option for investigation is to capture
USB traffic under Windows to check what happens there.

-- 
Regards,

Laurent Pinchart
