Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EF22258DC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 09:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgGTHn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 03:43:59 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46619 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726015AbgGTHn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 03:43:58 -0400
Received: from [78.134.114.177] (port=42258 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jxQSp-0001Yt-L9; Mon, 20 Jul 2020 09:43:55 +0200
Subject: Re: [PATCH v2 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, leonl@leopardimaging.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
 <1595013322-15077-2-git-send-email-skomatineni@nvidia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <75b7e3bb-cdc1-a266-09cb-3eedd79d198d@lucaceresoli.net>
Date:   Mon, 20 Jul 2020 09:43:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595013322-15077-2-git-send-email-skomatineni@nvidia.com>
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

On 17/07/20 21:15, Sowjanya Komatineni wrote:
> This patch adds IMX274 optional external clock input and voltage
> supplies to device tree bindings.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>


-- 
Luca
