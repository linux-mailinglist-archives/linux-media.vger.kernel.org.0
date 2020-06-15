Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11001F94A9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 12:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbgFOKfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 06:35:11 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:49482 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgFOKfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 06:35:10 -0400
Received: from belgarion ([86.210.245.36])
        by mwinf5d23 with ME
        id rNb62200B0nqnCN03Nb6kp; Mon, 15 Jun 2020 12:35:07 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 15 Jun 2020 12:35:07 +0200
X-ME-IP: 86.210.245.36
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: pxa_camera: remove an impossible condition
References: <20200610172615.GD90634@mwanda>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 15 Jun 2020 12:35:05 +0200
In-Reply-To: <20200610172615.GD90634@mwanda> (Dan Carpenter's message of "Wed,
        10 Jun 2020 20:26:15 +0300")
Message-ID: <877dw8borq.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> It's not possible for "pcdev->mclk" to be zero because we check for
> that earlier and set it to 20000000 in that situation.  If it were
> possible, that would be a problem because it could have lead to an Oops
> in the error handling when we call v4l2_clk_unregister(pcdev->mclk_clk);
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
