Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934A856A092
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 12:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbiGGK6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 06:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiGGK6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 06:58:30 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884C8AE7D
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 03:58:28 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4BF2E200A4;
        Thu,  7 Jul 2022 13:58:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657191504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f0NRo0Lhlg/cepkVnMUVo54oyw8Al+Vn/b9di9DwbA8=;
        b=nlhWfHMXYs9/cPERM/PMHR87WTDamot/Q2EVsJm5Ap1uobuWGpxbKM9UHNB3Ngr2F29fOf
        rcvgj/XAHiTdcI9xT9bIQeFPS4lmsxFafpIpED3cF5smqefJcLAfIKYhge1FKcOzYC/RlT
        xSgiGriPZeHJ2wIsgjkoeGoJRVJ8fas=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 746D0634C91;
        Thu,  7 Jul 2022 13:58:23 +0300 (EEST)
Date:   Thu, 7 Jul 2022 13:58:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 00/55] media: rkisp1: Cleanups and add support for
 i.MX8MP
Message-ID: <Ysa8T5p1/UrEKVbW@valkosipuli.retiisi.eu>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657191504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f0NRo0Lhlg/cepkVnMUVo54oyw8Al+Vn/b9di9DwbA8=;
        b=ZqO1NGVbpg/5K4go5KgIPxaSq/RmSSHEBiIM43f5Ap0vLvdRisxuNZSXzReSU/0HKqwL8w
        g1NsbeZdhBb4K40HDIdmXSJX+HLSTa7cgvvbDIadQPuNYVYxqeWsVijaoaGdtJ+M703+kk
        8lcfk4A8pwNjf446YOQW0snOWFFDcao=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657191504; a=rsa-sha256; cv=none;
        b=fAhLX3L4QUgFN4YmZs/K6HxuXhRTG+Zj6EnNOhGgOfKgL5gPZPDcMt6jI9p6iRoKh5Q3JQ
        eYiVyJkoTZypDjm16DhdacQCVbrmjmL0ixUIoh7U/muPR+AGPve9WIWvat0P9LrE0ges9/
        CCPHinNA+XmUz01A9oZ9Dd8VTcsclig=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 01, 2022 at 02:06:18AM +0300, Laurent Pinchart wrote:
> Laurent Pinchart (39):
>   media: v4l2-async: Add notifier operation to destroy asd instances
>   media: mc-entity: Rename media_entity_remote_pad() to
>     media_pad_remote_pad_first()
>   media: mc-entity: Add a new helper function to get a remote pad
>   media: mc-entity: Add a new helper function to get a remote pad for a
>     pad

Thanks!

For these:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
