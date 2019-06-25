Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAA4558A0
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 22:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfFYUTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 16:19:36 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43796 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfFYUTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 16:19:36 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A415980301;
        Tue, 25 Jun 2019 22:19:32 +0200 (CEST)
Date:   Tue, 25 Jun 2019 22:19:31 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me, Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v5 3/3] drm/panel: simple: Add GiantPlus GPM940B0 panel
 support
Message-ID: <20190625201931.GA16534@ravnborg.org>
References: <20190605222247.25657-1-paul@crapouillou.net>
 <20190605222247.25657-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605222247.25657-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
        a=p6pI0oa4AAAA:8 a=GuWfQEC4cNS6DloS6WAA:9 a=CjuIK1q_8ugA:10
        a=xLgPWTrI3asA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=9cw2y2bKwytFd151gpuR:22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 06, 2019 at 12:22:47AM +0200, Paul Cercueil wrote:
> The GiantPlus GPM940B0 is a simple 3.0" 320x240 24-bit TFT panel.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

All patches applied to drm-misc-next.
Added the ack from the mails to patch 2.

	Sam
