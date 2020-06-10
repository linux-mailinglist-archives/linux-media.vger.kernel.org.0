Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CCB1F5EEE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 01:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgFJXzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 19:55:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:58564 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726808AbgFJXzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 19:55:16 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7869E634C87;
        Thu, 11 Jun 2020 02:55:11 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jjAYo-0000KR-W7; Thu, 11 Jun 2020 02:55:11 +0300
Date:   Thu, 11 Jun 2020 02:55:10 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 00/10] Improvements to IMX290 CMOS driver
Message-ID: <20200610235510.GC805@valkosipuli.retiisi.org.uk>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Sun, Jun 07, 2020 at 07:30:15PM +0300, Andrey Konovalov wrote:
> This patchset adds improvements to the existing media driver for IMX290
> CMOS sensor from Sony. The major changes are adding 2 lane support,
> configurable link frequency & pixel rate, test pattern generation, and
> RAW12 mode support.

Could you still see what checkpatch.pl says and address the style issues,
please? Apart from those this seems fine to me.

There are some on msleep() but I wouldn't worry about those.

Thanks.

-- 
Sakari Ailus
