Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B27D213827
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 11:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgGCJxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 05:53:12 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49491 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726410AbgGCJxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 05:53:12 -0400
Received: from [78.134.117.153] (port=37144 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jrINZ-0000j7-UG; Fri, 03 Jul 2020 11:53:09 +0200
Subject: Re: [PATCHv2] imx274: fix frame interval handling
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Leon Luo <leonl@leopardimaging.com>
References: <e2733203-53ac-335b-cd4c-eccc1bb40319@xs4all.nl>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <c18c7416-eeeb-a76d-07b1-e6b86fa14ef5@lucaceresoli.net>
Date:   Fri, 3 Jul 2020 11:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e2733203-53ac-335b-cd4c-eccc1bb40319@xs4all.nl>
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

Hi Hans,

On 03/07/20 11:20, Hans Verkuil wrote:
> 1) the numerator and/or denominator might be 0, in that case
>    fall back to the default frame interval. This is per the spec
>    and this caused a v4l2-compliance failure.
> 
> 2) the updated frame interval wasn't returned in the s_frame_interval
>    subdev op.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
