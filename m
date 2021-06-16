Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2833A9E8D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 17:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbhFPPIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 11:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234432AbhFPPIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 11:08:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B839AC06175F
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 08:06:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: xclaesse)
        with ESMTPSA id 01A081F43912
Message-ID: <c268f0cc04cfc892270b406fb4302425dc097477.camel@collabora.com>
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
From:   Xavier Claessens <xavier.claessens@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, gjasny@googlemail.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, rosenp@gmail.com
Date:   Wed, 16 Jun 2021 11:06:04 -0400
In-Reply-To: <20210616165947.70f73cec@coco.lan>
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
         <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
         <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
         <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
         <443286a1-b955-1ac1-742d-42b9182a435f@collabora.com>
         <20210616165947.70f73cec@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 16 juin 2021 à 16:59 +0200, Mauro Carvalho Chehab a écrit :
> As mentioned in another response. Autotools is building with `-g
> > -O2` by
> > default, that'd the equivalent meson configuration option
> > --buildtype=debugoptimized. 
> 
> I can't understand the Meson's default... no optimization and no
> debug!
> Basically something that it is useless for both developers and for
> production. I wonder why they chose a crap default like that...

Most project make it the default with:
project(..., default_options : ['buildtype=debugoptimized'])

I _think_ it is not the default because it is often less debugable when
it's optimized.

Regards,
Xavier Claessens.

