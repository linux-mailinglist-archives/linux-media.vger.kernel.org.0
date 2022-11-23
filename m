Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F26636A77
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 21:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbiKWUE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 15:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237693AbiKWUEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 15:04:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CFD119
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 12:04:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E4CB890;
        Wed, 23 Nov 2022 21:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669233862;
        bh=LdYZTC1gVEpcfUgHbxrI8GSarNC99zUaFOxlBhPCO/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1ZlO0zLriTmhkd0LgdRC4xkflqS+2aqAEfVJdi/abjpqnL8IpXVm1c6aVRjzf6JV
         5leJNVjb9KxAKEKJSVJFENkc/LMvc54mBNnFWLY1Vaevtp0m1BVnhaKgga0V+TyyEu
         PZRbW6H0BLRWK53/obHoYt3+RYefSMvwRu0NVtr0=
Date:   Wed, 23 Nov 2022 22:04:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Amos Tibaldi <tibaldi.amos@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: request for help on uvcvideo driver issue
Message-ID: <Y358tj0cKyXyaFFF@pendragon.ideasonboard.com>
References: <CAKAO289-s=VJYJzt5JBCSvAzHmG-KMY12yX-RMREQTQCHVe6YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKAO289-s=VJYJzt5JBCSvAzHmG-KMY12yX-RMREQTQCHVe6YA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Amos,

CC'ing the linux-media mailing list.

On Wed, Nov 23, 2022 at 07:16:05PM +0100, Amos Tibaldi wrote:
> Hello,
>    I have a usb framegrabber and it worked fine in ubuntu 20.04 and previous
> releases of ubuntu with the uvcvideo.ko kernel module but now that I have
> ubuntu 22.10 the uvcvideo.ko does not work with the ezcap261 framegrabber. The
> ko is loaded but cheese or xawtv or vlc go on timeout when issuing video
> acquisition, and the select returns wrong argument. I have also updated the
> firmware of the framegrabber. What can I do?

Could you please send a copy of the kernel log, in text form ? You can
retrieve it with `dmesg` or `sudo dmesg`. I'm particularly interested in
messages printed when the device is plugged in, or when an application
attempts to use it.

-- 
Regards,

Laurent Pinchart
