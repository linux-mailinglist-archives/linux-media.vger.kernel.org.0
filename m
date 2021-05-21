Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB1C38C4A8
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 12:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhEUK1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 06:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhEUK1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 06:27:30 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F81C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 03:26:07 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 7FB8E1B00107;
        Fri, 21 May 2021 13:26:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1621592761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hbAOwmHiiDl8x/LqtrIjBOgAM0KFFbpMOcJocE+/G0U=;
        b=b9zvGmKn42bKeuQVFb4FhWNTCN2rRzVDfS4k0i21mAc/W/cEdgnwI5PbW3ZmQMTvkKyqaa
        UFtT+hntna3XSzEfRBnBNFZRX18u6Ots6Z3hI6jDMLlY8fl1gblxjlb7M3VqgtisxgYcU/
        HYB5fWuCojjTxaaXDY9Sg06qfBni2H16uJnCwAyVA3HiKbonKbwMeENPtiznOP2eYV9X33
        wuDfaT1LqY+DrirNXHpNvDEvJfXKoBihivBznNTIiDHQg6LoEptRY0fWbh00bmMGMZFR4Z
        L8TeXzARsHRSio1Zl2mc5fE+/2T3TAGSsBpu/pINKmRoqXa+nV4YAGB8S4/+4g==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E3F3D634C87;
        Fri, 21 May 2021 13:22:26 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lk2Ly-0000ni-7G; Fri, 21 May 2021 13:26:02 +0300
Date:   Fri, 21 May 2021 13:26:02 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andy.yeh@intel.com, jim.lai@intel.com, bingbu.cao@intel.com,
        tfiga@chromium.org, senozhatsky@google.com
Subject: Re: [PATCH v4 1/2] ov8856: Add support for 2 data lanes
Message-ID: <20210521102602.GF3@valkosipuli.retiisi.eu>
References: <20210520030706.7613-1-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520030706.7613-1-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1621592761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hbAOwmHiiDl8x/LqtrIjBOgAM0KFFbpMOcJocE+/G0U=;
        b=L+ci9bP3cPxO/Dor9JJzfQ35jEB39M23yihJTLESKYahb732Gil6tkP+4T9zvKuM+Jmo3L
        tEsx6dM6VlCO5tEzEcZ+7PZvxX8AlL2U28xJ68LAkre0AWGKtsJ8yNfIs2RPAL/pWUBYbS
        7TvK4G4+BXMVJ6QENecjhWPY7cGCzWc6aL9TZEGBqqkcIkwc/dsJCQD/JqrEzD9bH/+u79
        0IhQeIUd78lgUcTaUGsnY0jCiX9eoF6VGijDlwtAZ4ysTvfrIAsiZjMHheUtQOz87JkSGo
        l9NQYx8I/NnOVBn+1L9qd9GMm2iwZr8Dq2rFEvY3pu7BbECeFRNtfuCIIG+GOA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1621592761; a=rsa-sha256;
        cv=none;
        b=bltbJw6mlkx2AZXNlzdeO7T4G1ueK5iGqq/fZSTgIPOrhWKL4qjqSI2/yLF09zd9jz5z5H
        0xukYNLSk+hE7758mdzoHPyHFw/Fs/KXg8J7BGZUWDMrBUgB5aHski+GcpeP+RLRRUNh5D
        v55FsMI1k1JknaysgdEY4OVL1K5qNHO8GPGzqvUavKSTsi4MJhBKYLHZZI4zHEOktX/IjQ
        WMJ6xLAI4VzMdF2iwbyGZy4vDTxf07H1lxw/6cdFgtp17y8+LlQQqMAdiK5g1lzsNRslIe
        tFWHt7M70EDGppaD8D3izfAhJiRv8LfFJzuTE2e7o6zQzv6lZTVBI7QBZ4gGQw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Thu, May 20, 2021 at 11:07:05AM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> The OV8856 sensor can output frames with 2/4 CSI2 data lanes.
> This commit adds support for 2 lane mode in addition to the 4 lane
> and also configuring the data lane settings in the driver based on
> system configuration.
> 
> - Fix Bayer order output in 1640x1232 binning registers
> - supported data lanes
>   + 3280x2464 on 2 & 4 lanes
>   + 1640x1232 on 2 & 4 lanes
>   + 3264x2448 on 4 lanes
>   + 1632x1224 on 4 lanes
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
> Acked-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Did something change here? The previous version you sent was labelled as
v4. It's in my tree.

-- 
Sakari Ailus
