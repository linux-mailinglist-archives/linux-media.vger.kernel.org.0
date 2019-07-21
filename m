Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898DC6F3D2
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 17:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfGUPCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 11:02:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55890 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfGUPCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 11:02:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E8208283D5D
Message-ID: <c7a7798b65e38355230d9ee235a3f8aa331123ca.camel@collabora.com>
Subject: Re: [PATCH v3] media: dvb: Provide 4 devm variants
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Date:   Sun, 21 Jul 2019 12:02:44 -0300
In-Reply-To: <068836c7-a116-7e6f-cbb2-f2176fbb9a38@free.fr>
References: <068836c7-a116-7e6f-cbb2-f2176fbb9a38@free.fr>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marc,

Thanks for your patch.

On Thu, 2019-07-18 at 15:03 +0200, Marc Gonzalez wrote:
> Provide devm variants for automatic resource release on device removal.
> Makes error-handling in probe() simpler, thus less error-prone.
> Once all resources are devmanaged, remove() is no longer needed.
> 

I think it would be better to add this API as part of a series
that also uses it.

Regards,
Eze

