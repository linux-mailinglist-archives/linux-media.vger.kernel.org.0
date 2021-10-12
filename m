Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25B842A354
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 13:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236193AbhJLLca convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 Oct 2021 07:32:30 -0400
Received: from ni.piap.pl ([195.187.100.5]:59078 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232665AbhJLLc2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 07:32:28 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
References: <m34k9uml6s.fsf@t19.piap.pl>
        <07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
        <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl>
Date:   Tue, 12 Oct 2021 13:30:23 +0200
In-Reply-To: <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl> (Hans Verkuil's
        message of "Tue, 12 Oct 2021 09:51:20 +0200")
Message-ID: <m3bl3ulbu8.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

> I can take this patch and merge it, right? Even though it mostly changes
> drivers/gpu/ipu-v3/ipu-csi.c, it is still something for the media tree to pick
> up, I think. Just checking to avoid this patch going in via two subsystems...

Aah, sorry about that, didn't want to produce too much patch-noise.
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
