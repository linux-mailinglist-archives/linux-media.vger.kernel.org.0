Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635667B51C2
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 13:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236781AbjJBLyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 07:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjJBLyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 07:54:22 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AB3C6
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 04:54:18 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RzfW826X7zydx;
        Mon,  2 Oct 2023 14:54:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1696247653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kfSC4/2zoxzdxEYFmAenp9rCsbvl+LCgdDxofqHFG+4=;
        b=Mo/zxf2jH24igdWdAPtiJvlUMLJjTlbyL4ejHrs5VZWxNVK3K6rYomN0cil99I/X9kA7Xq
        JGSqbav2Z80DVEm++3icNQtQzB+pUb7X9mEBL1z5ADUtgny1TagLd+rbeauNyz2LvUACSI
        2iJ7C316OtyI0bOIq1D74a/GXZJFJZM=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1696247653; a=rsa-sha256; cv=none;
        b=eYWmSMaamUqXx6tdL1qcDhoxEf4e2tEoc7n3pAjw4mjXEZysQdFfqCr+YaZdFxJxYUvA1r
        q2jmHdynT2OExEDJVjTFsrJ8sx0kT24kdY98i+XUjUOAso3LwhhbMNLjZu6sGKl3IBKeOd
        ITXCsMNpXZXd4ug0DHxUJTLP+FxXknc=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1696247653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kfSC4/2zoxzdxEYFmAenp9rCsbvl+LCgdDxofqHFG+4=;
        b=KtNgb49Oc36ytH4QSW3HGtu6W5G/OBT7pQsoojN9SBgIPk5dW3Y13wuH8Oa+cnvO+Bnjh2
        wwbOn/aK8M86hUnPtq5tnUKvSnL3bwiPTnoJ5gsehCwc+BIAOLROlBoENF/He27BbCKVqg
        mtcOEryP3VSQSk8arx+S/b/A9RPSDbE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A3633634C93;
        Mon,  2 Oct 2023 14:54:11 +0300 (EEST)
Date:   Mon, 2 Oct 2023 11:54:11 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v7 00/19] Small fixes and cleanups (ov2740 and ccs)
Message-ID: <ZRqvY008jyOlwJUZ@valkosipuli.retiisi.eu>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 02, 2023 at 01:55:38PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> This small set contains fixes and cleanups, mainly for the ccs and ov2740
> drivers. I wrote these while working on the metadata set, but these could
> and should be merged earlier.
> 
> since v6:
> 
> - New patch: In scope of the CCS driver, revert the patch moving CCS to
>   use pm_runtime_get_and_resume().
> 
> - New patch: Drop s_stream re-entrancy in CCS driver.
> 
> - New patch: Rename ccs_create_subdev() as ccs_init_subdev.
> 
> - New patch: CCS driver rework: move sub-device initialisation earlier in
>   probe to address initialisation ordering issues later on in embedded
>   data support. This introduces minor changes to the patch adding
>   sub-device state support.

In addition:

- MIPI CSI-2 long packet DT macro change as suggested in review.

-- 
Sakari Ailus
