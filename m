Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829E31FCEA7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 15:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgFQNhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 09:37:18 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:49451 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgFQNhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 09:37:17 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id A6E283C057C;
        Wed, 17 Jun 2020 15:37:15 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JJV9MfC_7Tsw; Wed, 17 Jun 2020 15:37:10 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AB1AA3C00BA;
        Wed, 17 Jun 2020 15:37:10 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 15:37:10 +0200
Date:   Wed, 17 Jun 2020 15:37:05 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
CC:     <niklas.soderlund@ragnatech.se>, <akiyama@nds-osk.co.jp>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <mchehab@kernel.org>,
        <michael@rodin.online>, <mrodin@de.adit-jv.com>,
        <securitycheck@denso.co.jp>
Subject: Re: [PATCH v7 1/2] media: rcar-csi2: Correct the selection of
 hsfreqrange
Message-ID: <20200617133705.GA88066@vmlxhi-121.adit-jv.com>
References: <20200615141126.GE915368@oden.dyn.berto.se>
 <1592369843-32217-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1592369843-32217-1-git-send-email-sudipi@jp.adit-jv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

thanks for your work! It looks like your PHTW patch is missing:

"[PATCH] rcar-vin: rcar-csi2: Select the correct PHTW register"

-- 
Best Regards,
Michael
