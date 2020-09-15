Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D4C26A20B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgIOJVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:21:08 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57919 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgIOJVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:21:07 -0400
Received: from [78.134.51.148] (port=48280 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kI796-0001EN-IM; Tue, 15 Sep 2020 11:21:04 +0200
Subject: Re: [PATCH v2 1/2] media: imx274: remove binning enum
To:     Eugen Hristev <eugen.hristev@microchip.com>, sakari.ailus@iki.fi,
        leonl@leopardimaging.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@ifi.fi>
References: <20200915090442.52322-1-eugen.hristev@microchip.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <bc455c26-d639-7401-b8b5-92a45a628d3a@lucaceresoli.net>
Date:   Tue, 15 Sep 2020 11:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915090442.52322-1-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/09/20 11:04, Eugen Hristev wrote:
> Binning enum is unused. Remove from driver.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@ifi.fi>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
