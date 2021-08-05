Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8312F3E176E
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 16:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhHEO6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 10:58:50 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:39022 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbhHEO6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 10:58:49 -0400
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id EE8DA1B00215;
        Thu,  5 Aug 2021 17:58:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1628175514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vT3T1J6kKUXYEysk7GS6IopK47oOvdcZQh9xd4z520g=;
        b=ZArHu0KEVtchjBW2kf68q+lfjIKdT2CVPUGDDp/MKN5DHABs/+yIyQX034R0SshrlOfdZb
        yafjr5qxufHZ/+a9mBLkzSZ1yIIqcGRyyw3Nxoo9GZ6kf/zFTq7pb0CWJZFg1okypNbTAh
        1AMLtcLRLiA3Qsvo0qKSMQwhy1+pWs2Ds6JzYHzv8Qi4zfhD0X3xcraGrCof278CaTdGAM
        ycwgt87Xg8bH2gq9500olBC0IdLI9Bx5sYBCqHTmYCRbQ9eOy1Ah4uEHiuA5svDGA4Gn6m
        gMOdn4nyOi+kscxJhpmYThlur22wgNB15PD33hzxXueTJqSRrYHWaOa/lzHdSw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8899A634C89;
        Thu,  5 Aug 2021 17:57:14 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mBepB-00032l-IY; Thu, 05 Aug 2021 17:58:21 +0300
Date:   Thu, 5 Aug 2021 17:58:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: atomisp: remove the repeated declaration
Message-ID: <20210805145821.GD3@valkosipuli.retiisi.eu>
References: <1621922559-1859-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621922559-1859-1-git-send-email-zhangshaokun@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1628175514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vT3T1J6kKUXYEysk7GS6IopK47oOvdcZQh9xd4z520g=;
        b=eYSt3awvxvinljep5eEkzM5PRDkY0u6WfGclHk/ZSNEJvom7+MEtqpK9+KJxsA7cq7c0Do
        6Tqv2qFzy+Ay0E6qaOJZ4qBpT3YwENk1Y9L22k8ZbTfjqgIuElMO3tTX/qUkjgv4zFUqnX
        +RhKip31aga8YMa/57vQ3g64Sfpb52UJE0b5n2PY4Hj3KlGAbGo11OtRodX08unyc12ls1
        23+KnA1DMyUSrMv5T+Z59Ge9eML08w9Oi78/7ZqJBeHmQHZQjqkfSb0SFXpgCiAVZgCBqX
        1CFUZ4RzXv48CSiqOxvJIEGVSMeg+4mcSQLONoI1cE1oI+ZeVGqQ9ahykHTfpw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1628175514; a=rsa-sha256;
        cv=none;
        b=r/p9/rc1OtfpsCI1UaAKwa9wdROOE1R9i+ywoK6bWkJAwJAbVeD5Ds4CFElXy6eoblI15h
        SkPJ0jhBjcH9gcHUnkLpww7MkAeIlrv8k69NrnNO9SWdKfRiwkmjuAOBSby0kpKTWVDzxp
        jktvUvq7yEonf56m/A94A6GnUtDOTKn5CzCHsnL8efcjQWbmG97KTEm0TkEhtZSB2P3pCs
        taVBzR5u1cpkWm63u7gq6KpIMWbtEGVYaH/1JWgMIv45QNizGSPDFHI9K/Vy0J43Jrrlao
        CUxfFug4vHpgmxeETIOjEf22oJPYn6apEjsf+UFerjouyqFOGV3UecqytXjrgw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 25, 2021 at 02:02:39PM +0800, Shaokun Zhang wrote:
> Function 'ia_css_mmu_invalidate_cache' is declared twice, remove the
> repeated declaration.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
