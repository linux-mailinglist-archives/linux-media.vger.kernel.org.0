Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0397E6FA321
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbjEHJUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjEHJUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:20:18 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6B39ED0
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:20:17 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QFG3L14xBzyVR;
        Mon,  8 May 2023 12:20:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1683537615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=3r5qm0pjmIPtNFgLGq2IBvBt0ihvgT4nbOaE3XK8zLg=;
        b=JtyqtTZcuwCXcGrvE0xFS3zyfEPWP3oPpCYHG88BU68o9EQ1hZeBxm9il8rQacBNFH96lm
        c/FF6xbPGA0W9h/kG6tB2UHa9kgSux5V9l5vvZn6KAAlGXaujHV0AQ76PenTFqmCDOHHyX
        TXGd8AgI93nBNjPNuAFYxu/QcdLmFag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1683537615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=3r5qm0pjmIPtNFgLGq2IBvBt0ihvgT4nbOaE3XK8zLg=;
        b=sB6ZFzddy6TN1fPXPiROE54zcy1N3QIjGeaJOppcqCO/pkzfsJyIndueLe+4xxy53YK1yP
        82+ElI5cfPUdY/9qHghYaze+RU+DVLhxC0Xyx3LAzYk1Xcwd8GWjwSxLjAHWGHOxjLCbw4
        YRVjSitYWA18xX2lAtCIsvDgqe4Tznw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1683537615; a=rsa-sha256; cv=none;
        b=mL/NS/hwdCPAWnHNJ4R3XhOZIofvA/PcHzSqyubJHS30JCzpZHLWSlDjNCmb5ZZqdSfJYq
        Km3IrVOjgmfiEd+g42joKBx2bnqiMgSK7lBVv1bmnbrj6Aip/oEsAeiff7VQjIaV9f91+z
        j1c4+zG0PS5D1++29uJ+nS1XcVdtsF4=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60997634C91;
        Mon,  8 May 2023 12:20:13 +0300 (EEST)
Date:   Mon, 8 May 2023 12:20:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 0/3] Random cleanups
Message-ID: <ZFi+zWx9VytoJSCl@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508091753.80803-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This was meant to be v2.

-- 
Sakari Ailus
