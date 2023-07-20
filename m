Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C023A75B04F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 15:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjGTNo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 09:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjGTNo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 09:44:56 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CBB210B
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 06:44:53 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22E3E6000A;
        Thu, 20 Jul 2023 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689860692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4E5D+NoyeHfMBkGFN9CS/OId+ov0zCrvbzGLvU/4DTc=;
        b=Un02aD2oSm1RloGejVSwMM1CWjlUhG//DKpIHGE0mP6IDTtXhoNCL8fHzWdQrqRiQRdmIR
        j/D0mviaFh6KhKFjsgu66Bgz4YFhvkEm8PI8OEEBKpOvh6RcDfdTmsZBre6Pg1s6nHS0mr
        SnkgUSP44DT8GTpOra5op2O0GYJpETmiW/nr9xZfxQep3V2vT1MJX94mL/z95wWrxisorf
        X+GQu3adQ7erByeUsFoVL13tNeGkJYdTUhGpOc7P+wvA4+b6wjJPi56bJORoIJarq/LUuf
        O3VuM4/5EPe4LEvgwVTmWswcpdHvu/VJUDSTg6KNpb6u3GYIvHPDIBGA8wQauw==
Date:   Thu, 20 Jul 2023 15:44:45 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: include video.h header
Message-ID: <20230720154445.34984607@booty>
In-Reply-To: <4d55437f-4b3e-8a06-1d8e-e603dc333383@xs4all.nl>
References: <4d55437f-4b3e-8a06-1d8e-e603dc333383@xs4all.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, 20 Jul 2023 09:20:03 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> This tells sparse that tegra_vip_driver is actually used,
> and so avoids this warning:
> 
> drivers/staging/media/tegra-video/vip.c:280:31: warning: 'tegra_vip_driver' defined but not used [-Wunused-variable]
>   280 | static struct platform_driver tegra_vip_driver = {
>       |                               ^~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>


Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
