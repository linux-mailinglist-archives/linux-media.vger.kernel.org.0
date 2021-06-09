Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AAD3A0AD9
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 05:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236599AbhFIDwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 23:52:05 -0400
Received: from smtprelay0055.hostedemail.com ([216.40.44.55]:54174 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232663AbhFIDwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 23:52:04 -0400
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id E08E2100E7B42;
        Wed,  9 Jun 2021 03:50:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 00DBE2448B8;
        Wed,  9 Jun 2021 03:50:08 +0000 (UTC)
Message-ID: <601ccbd8b792abd0177475dd09fdd2d6c6f4a6af.camel@perches.com>
Subject: Re: [PATCH] drivers/media/usb/gspca: fix typo issues
From:   Joe Perches <joe@perches.com>
To:     Herman <herman.yim88@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Date:   Tue, 08 Jun 2021 20:50:07 -0700
In-Reply-To: <20210609033245.3410-1-yanshuaijun@yulong.com>
References: <20210609033245.3410-1-yanshuaijun@yulong.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.75
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 00DBE2448B8
X-Stat-Signature: hjs4d3sspc3pgzqpn4bui4ttzasi7mp4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+kmaYY4IQks9Mb8gl3kaXbJLpjBL4RF8E=
X-HE-Tag: 1623210608-368423
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-06-09 at 11:32 +0800, Herman wrote:
> spca501.c : remove redundant 'is'
> zc3xx.c   : change 'outdoore' into 'outdoor'
[]
> diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
[]
> @@ -5806,7 +5806,7 @@ static void setquality(struct gspca_dev *gspca_dev)
>   * Valid frequencies are:
>   *	50Hz, for European and Asian lighting (default)
>   *	60Hz, for American lighting
> - *	0 = No Fliker (for outdoore usage)
> + *	0 = No Fliker (for outdoor usage)

Fliker/Flicker?

but there are a lot of those in this file...

