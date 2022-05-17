Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5E352AE8E
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 01:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbiEQX3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 19:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiEQX3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 19:29:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5685036E2D
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 16:29:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [45.131.31.124])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A78544A8;
        Wed, 18 May 2022 01:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652830179;
        bh=kOUPxjEMF7IK2ruFjPOYSEypRujGE8PjmKcPcesJlM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARSqrGoOzF2VguOMht2qXQO76oLbP9GMrFhH34kK25SDsSbj3jztzA7BFxqhQXavX
         DD4QD+0w9k7ITZNoi2oJU4pWAL9kOfsBnOQ5d69s5ag0v/EppXXIbRqXLIqGPOnSox
         JLDZ/E3e6Uof0RadFetQ9E7MDU3lKoTiWx2JRd7w=
Date:   Wed, 18 May 2022 02:29:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander =?utf-8?Q?Wipperf=C3=BCrth?= <wpprfrth@posteo.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: game capture usb device stops working
Message-ID: <YoQv1CTNTInprDXd@pendragon.ideasonboard.com>
References: <dc489dbf-fbd0-db97-009d-df3eb94860fb@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc489dbf-fbd0-db97-009d-df3eb94860fb@posteo.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Tue, May 17, 2022 at 08:34:18PM +0000, Alexander Wipperfürth wrote:
> Hello, today I got a usb capture card (Elgato HD60 S+) which is uvc 
> compatible and the first time I connected it to my computer it was 
> immediately recognized and the video from the game console was displayed 
> in OBS, but when I change any setting in the configuration menu the 
> device stops working, no video will be displayed anymore, I have to plug 
> it in and out multiple times until it starts showing video again, I hope 
> with me stating this issue here someone maybe knows a solution or 
> explanation why this could happen.
> 
> Is there anything I should provide that may be useful?

Are there any messages printed to the kernel log when this occurs ?

-- 
Regards,

Laurent Pinchart
