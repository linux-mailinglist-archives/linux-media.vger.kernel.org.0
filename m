Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3CE204F0C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732168AbgFWKab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:30:31 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:35512 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbgFWKab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:30:31 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2A4CE3C0022;
        Tue, 23 Jun 2020 12:30:29 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N-8CV-nyzYOp; Tue, 23 Jun 2020 12:30:24 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 99DBF3C0588;
        Tue, 23 Jun 2020 12:30:07 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.45) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 23 Jun
 2020 12:30:06 +0200
Date:   Tue, 23 Jun 2020 12:30:02 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     <lolivei@synopsys.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>,
        <roman.kovalivskyi@globallogic.com>,
        <dave.stevenson@raspberrypi.org>, <naush@raspberrypi.com>,
        <mrodin@de.adit-jv.com>, <hugues.fruchet@st.com>,
        <mripard@kernel.org>, <aford173@gmail.com>,
        <sudipi@jp.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <erosca@de.adit-jv.com>, <linux-media@vger.kernel.org>,
        <libcamera-devel@lists.libcamera.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 00/25] media: ov5647: Support RaspberryPi Camera Module v1
Message-ID: <20200623103002.GA10561@lxhi-065.adit-jv.com>
References: <20200622171910.608894-1-jacopo@jmondi.org>
 <20200622172614.gcwxubshubl7qzpl@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200622172614.gcwxubshubl7qzpl@uno.localdomain>
X-Originating-IP: [10.72.94.45]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Many thanks for your precious contribution.

On Mon, Jun 22, 2020 at 07:26:14PM +0200, Jacopo Mondi wrote:
> My ISP has rejected the rest of the series: too many emails :(
> Has it ever happened to anyone else ? How did you solved this ?

I guess leaving 5-10 seconds between sending individual patches should
overcome this? I wonder if git provides a built-in command for that?

-- 
Best regards,
Eugeniu Rosca
