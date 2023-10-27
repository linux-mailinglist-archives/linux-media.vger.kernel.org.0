Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB6E7D9CAA
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 17:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjJ0PL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 11:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjJ0PL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 11:11:28 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5C4C4
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 08:11:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4SH5j56CqBzyRk;
        Fri, 27 Oct 2023 18:11:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1698419482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eJaEfqgbmoSqCjViwRr/QATXU7CcVRrNUFeHJNWykik=;
        b=R9Pn4zfTTV06nwWRFbrOqfpSywAof7HV/XVsKZDB9dadshwoqupIn0Ym0eH5hFRIPNlExl
        2ST2ttRDHRINrauTvlUNaPkpyXKYkJrLQ4oHxNu/fsHbySf/nE/8/Z2QqxbNr2sya9D3tC
        rXB0wmu1xQdA8KPYWyKz6GLZp0s8gLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1698419482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eJaEfqgbmoSqCjViwRr/QATXU7CcVRrNUFeHJNWykik=;
        b=T1q3N1clfLsAHMByvLu3rak4FwkXeR0H7/OvCJ3zQUVZmR/dJp0B9B3k1f04OyJKQkJFNR
        eUx6mceQQNNuHem8GXUD1IDhlnFPg9z6SXwLmzOSlC6io1Q0c9hsT9EeFOHNlFComvUlOV
        V1sBQYPkYSOtdbMj4+lFBR1MOMc3h5E=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1698419482; a=rsa-sha256; cv=none;
        b=nqWsV2+HKmca5imz86dQD5+KsfmSmVDqpVKKO1/XbScB9qVKobS84V32xYYyYWzmwAyCuC
        TTVgGRoG/rV+GAlaB7pzLemdbJtZ3/CxO+4snQH4pmenCCgreGBEyHo4vXvLrJM5qswm8V
        q+u7UL6o2C4Qt1ZJ5sa4fvd5kHawDAc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AF7FE634C93;
        Fri, 27 Oct 2023 18:11:17 +0300 (EEST)
Date:   Fri, 27 Oct 2023 15:11:17 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Petr Cvek <petrcvekcz@gmail.com>
Subject: Re: [PATCH 0/7] media: v4l2-subdev: Rename pad config 'try_*' fields
Message-ID: <ZTvTFUwCruLr0Ps_@valkosipuli.retiisi.eu>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 12:40:04AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This series is the result of me getting bothered by the following note
> in the documentation of the v4l2_subdev_pad_config structure:
> 
>  * Note: This struct is also used in active state, and the 'try' prefix is
>  * historical and to be removed.
> 
> So I decided to drop the prefix.
> 
> Patches 1/7 to 6/7 replace direct usage of the fields in drivers with
> the corresponding accessor functions. There was a relatively large
> number of them in sensor drivers (in 6/7), but more worryingly, the
> atmel-isi (1/7), microchip-isc (2/7) and tegra-video (5/7) should really
> not have messed up with creating a v4l2_subdev_pad_config structure
> manually. I urge the maintainers of those drivers to address the issue.
> 
> Finally, patch 7/7 renames the fields, which becomes easy after
> addressing all the drivers.
> 
> The patches have been compile-tested only.
> 
> Sakari, this conflicts with your "[PATCH v3 0/8] Unify sub-device state
> access functions" series. I don't mind rebasing on top if it gets merged
> first.

Thanks for the set, it's really nice. I missed there were so many drivers
still accessing this information directly --- I rather thought we always
had the access functions to do that, and all drivers used those.

I see you've already rebased v2 on top of the cleanups, I'll take these
then.

-- 
Regards,

Sakari Ailus
