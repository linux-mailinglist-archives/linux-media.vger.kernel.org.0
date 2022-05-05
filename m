Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6050D51BA8B
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 10:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349368AbiEEIgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 04:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245743AbiEEIgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 04:36:39 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B43DF51
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 01:33:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 792232054A;
        Thu,  5 May 2022 11:32:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1651739578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T8U28Xq6WOzwBKyUZrBWmOfHkDo7K4TIT8JIkJxhEXE=;
        b=YDB51sJJb+d7Pj0ev2j8XHZc8HCHxeX42yLJAW2LIw0IkL6aXU21evQO5DAHx6WLueO0AP
        9LCIdGlw/U59t3K3dP4NfydTALkcjMwoFtX2yXgo0duBukJq21d5CRkyc5nvfCN3+TGFLc
        Add1u1lMJr9fdsDV6P2oDIABQcTUDl0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 125A2634C91;
        Thu,  5 May 2022 11:32:58 +0300 (EEST)
Date:   Thu, 5 May 2022 11:32:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, linux-media@vger.kernel.org,
        kbuild-all@lists.01.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Message-ID: <YnOLueXnmsm9ig4B@valkosipuli.retiisi.eu>
References: <20220504223027.3480287-16-djrscally@gmail.com>
 <202205050844.k1CPWqtV-lkp@intel.com>
 <0ae34349-f4c0-4388-b33f-73603ab464ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ae34349-f4c0-4388-b33f-73603ab464ce@gmail.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1651739578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T8U28Xq6WOzwBKyUZrBWmOfHkDo7K4TIT8JIkJxhEXE=;
        b=xVke6DUcu0LAwfyu5/FuHgVU1TnccwwSdixGmvbbgsrpDLc0DAez5tzKRpa0w5E8agvoqA
        pwxwzaHahWZqePY9MxgcH6hvtnaAKUkG7McKswCaARka2pEixtN9kNF3DPjN2qnIfEpDOz
        TcVXfvshAUmoAePSKn8mp9WfuLXKxnw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1651739578; a=rsa-sha256; cv=none;
        b=x8/vD/pmcYcN7bPiZc2ZAOYYdPyLgvefX+lOAk32xCWXl/lNv7Tiw+kVyYvijbJsIYk5/r
        2WeuIppQdL9HeDlyEnufPn3dKgkH5rNGAA2yRplKkzi4JHivK6jVKpGP+gvJ0+Yxls0TlU
        22RwmmX/9oINhWztbls9wkyt5HfJViI=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 05, 2022 at 09:04:32AM +0100, Daniel Scally wrote:
> Argh - I screwed up a rebase here, not sure how I missed that. Sorry
> all, let me resend

If it's just that, I can fix it. No need to resend.

-- 
Sakari Ailus
