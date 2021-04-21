Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AC9366AD3
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 14:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbhDUMbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 08:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238576AbhDUMbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 08:31:00 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D1CC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 05:30:27 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 517151B001E8;
        Wed, 21 Apr 2021 15:30:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1619008220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3/WCHwYiFFTUkkJuc2hQegd7tdxkgw33WahN+LcXHNA=;
        b=Q8FkFfT1MhVhsfCHt3E5u7fwKYYLylF4zTj/wlSqjil5Qnnv1gFuD4M00t0INFFruMk8hO
        Vlie6rc1x124NwPAuxwq2AbIA+QQ98zTxb6nhxKaU9fICxB/fi0pSucY1sITz4SNlj7aZo
        Bsy+uHtnD4Cf5856sbD1FI20240CZeF+8bQYxL7own68b9D7KhIdiFAPN3DG+tv7lqvqyI
        pTCzeCrI+87XvVpoX2Y2IZXd8PdkGRE5enYrsu+9P49n2Ryc8skwboUhIBNRDNcIZWMFsA
        SAENN1jxvQs9Vu1bLwJOL59o7TT7AgZcDYeImaw7qmYbbF4w0bub50cVoR/cKw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 74462634C87;
        Wed, 21 Apr 2021 15:28:54 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lZBzo-0003RF-G5; Wed, 21 Apr 2021 15:30:20 +0300
Date:   Wed, 21 Apr 2021 15:30:20 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bernhard Wimmer <be.wimm@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ccs: Fix the op_pll_multiplier address
Message-ID: <20210421123020.GJ3@valkosipuli.retiisi.eu>
References: <20210414162453.22868-1-be.wimm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414162453.22868-1-be.wimm@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1619008220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3/WCHwYiFFTUkkJuc2hQegd7tdxkgw33WahN+LcXHNA=;
        b=jU/ESwG04x6JhIWASY5X52p2cvRg3mM433mc+UUmsljlCkGTAontisExi8yIUFIkTF1RDP
        ayQ2PM91u4AwDxqZu9aIV+WK65ZvsgedRIvGSg1BYboM7uYrEZ9bX8Adbpl4XdRfmDduj5
        VrB5qWBIrM5Ip57beQw3ugT51Lq1JosNykKo6d7NaLzgOrOgISreIE+j3q46gpY+h/w/hA
        Z4MLht4fT9nZa1PqVNWbI4yh8trlCdPMn+7YhqXLyye1VkdNvci6GDOW/D6cePj0n3BlUn
        +CugDCkxvnzvoZX+lS0FpqmpUNbgfK9psW/M/7qOXA6Niw6jFCGjlTpQEGLvHg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1619008220; a=rsa-sha256;
        cv=none;
        b=KSZMALGE4UmeaRtWJ9pLou0F2kdV4H5MlGnJraoj8uzkhOCXgGO6+keWIdR2nM3aSxb6MH
        yD+CX720f0xS/Spnos/eaGstO+8VA0sO1suopuc5fpWVecgwBkkZJrIdz8Iyj/Sqkk8BdX
        wNtQnAyxKMRUGX7xrv56smTbcWfybl5/hODOBrml09r31+/aqH3yJLybFb/V4jGl3C8vlV
        U7d7+VHlJZhzlMKQc27FfxwMjImVOtOfSQH4lc5Hqse9bWjbcEk+guYbS447KLTsYbz0kQ
        +ZisAVKerlkkLbB1m4BQNM3qWo7zWHRczNy67p9vjZoI8Cqow5Hs/V3TLKaViA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bernhard,

Thanks for the patch.

On Wed, Apr 14, 2021 at 06:24:53PM +0200, Bernhard Wimmer wrote:
> According to the CCS spec the op_pll_multiplier address is 0x030e,
> not 0x031e.
> 
> Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>

I missed last time that the register file and the driver were merged at a
different time and the driver fix needs to be backported to the stable
tree. Could you split the patch into two, i.e. one that has the changes
under Documentation and another one in drivers?

I can do that too, just let me know.

Thanks.

-- 
Kind regards,

Sakari Ailus
