Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7061B55036E
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 10:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiFRIB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 04:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiFRH74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 03:59:56 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2734133B
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 00:59:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id B27F420149;
        Sat, 18 Jun 2022 10:59:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1655539191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KlMw0XSawj1T5Dezfe62hcKs7VMR9I2kqfgViO3V4kQ=;
        b=IePcGfD4dvyyISfja5HakAumsDZhRLfNFIX5v1Tqoj7w9ziajqmEN/5XQcoIIYIC0MZhne
        oghOadAsEPbKhx6oNLZhPAlo+wBx9Xz9pGBED3an5QL+fctrnB6jwJAwOI7TeWQ44jvLEe
        cXOC0QBTL+3GAbf1uOiP6YEnIV5zoL8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 158E3634C91;
        Sat, 18 Jun 2022 10:59:51 +0300 (EEST)
Date:   Sat, 18 Jun 2022 10:59:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] libv4l2subdev: Fix compilation error by including
 missing header
Message-ID: <Yq2F9hVGmyDeqgGD@valkosipuli.retiisi.eu>
References: <20220616172943.31221-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616172943.31221-1-laurent.pinchart@ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1655539191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KlMw0XSawj1T5Dezfe62hcKs7VMR9I2kqfgViO3V4kQ=;
        b=dVZOGue4G0EvA6oAnHmktWBkn+oKDX9VnzWbK2bnvq93Gu1cIckJR97C9ADzQTtMh8qKuA
        9VMrZln/RGIdoL2v1/GabGBo3wsPeeuMzJ3Iimp5F5wWthHCE/fD8wSf5NJuTJqqykjoV4
        vr0SWZTqoYCpnIXjVHVHbRQMdKkBMw0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1655539191; a=rsa-sha256; cv=none;
        b=YYvkxUTSuHCZTs6rtMlVlcl1LHAR4+wH5qBGxBro4eVLIwmOEUXgRMrTzxi+JGNnBfcOl4
        iwdPDRRLm9ZJJpYI/zzTOXjn99jkFOnswFBlnUu3MJkg46hzRsRHInuCcfAYgHFMcXLes6
        PAGMxkxlB9ySHDzr4H3sBshLiaOndV0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 16, 2022 at 08:29:43PM +0300, Laurent Pinchart wrote:
> The uintptr_t type is defined in stdint.h, which wasn't included. Fix
> it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
