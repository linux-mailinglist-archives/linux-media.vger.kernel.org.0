Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F0C26A21E
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIOJZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:25:47 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49552 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgIOJZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:25:44 -0400
Received: from [78.134.51.148] (port=48312 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kI7Da-000300-8a; Tue, 15 Sep 2020 11:25:42 +0200
Subject: Re: [PATCH v2 2/2] media: imx274: add support for sensor mode6,
 1280x540
To:     Eugen Hristev <eugen.hristev@microchip.com>, sakari.ailus@iki.fi,
        leonl@leopardimaging.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20200915090442.52322-1-eugen.hristev@microchip.com>
 <20200915090442.52322-2-eugen.hristev@microchip.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <b4509a0a-e5d4-9def-644c-22220135b133@lucaceresoli.net>
Date:   Tue, 15 Sep 2020 11:25:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915090442.52322-2-eugen.hristev@microchip.com>
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
> Add support for the mode 6 for the sensor, this mode uses
> 3/8 subsampling and 3 horizontal binning.
> Aspect ratio is changed.
> Split the bin_ratio variable into two parts, one for
> width and one for height, as the ratio is no longer preserved
> when doing subsampling in this mode.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
