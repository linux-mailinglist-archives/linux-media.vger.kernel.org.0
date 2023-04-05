Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEA56D79B5
	for <lists+linux-media@lfdr.de>; Wed,  5 Apr 2023 12:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjDEK3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Apr 2023 06:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjDEK3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Apr 2023 06:29:31 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB11335BF
        for <linux-media@vger.kernel.org>; Wed,  5 Apr 2023 03:29:29 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzcv-3yyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4505:1fdc::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ps18Q5rVNz49Q1F;
        Wed,  5 Apr 2023 13:29:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1680690567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7W0TFfp3Ay47+apvpECqJBYQ5lfPu8VHB4ob/VE5pJg=;
        b=AV8povurJw/DxWc4TB/IuCgmY7ex84ObzEkwSoPV6S2NNRnE3S5w7nXlCnnyq2QQ6JgekL
        HqsWyKTmXFPpe+ZGtXDZllfpnehW7+T2y/jKntawAcmW1OL4QHe1yICsLRrod3yBjf9ADq
        y2l8GsnKoBkz2N0rvf+gH+zttG/nxDxggmNOxplkEzA7/vRa7xKrm8LB2wFpstsmOkwMJH
        kvnJVNBKuLfF7l+5rljv+AsFm89XDWzc/qAQCCNh1hd5DzBHGOGIsTRC5kn7rtqyB2ny6+
        XNZhx4I8S+9uhekCzEDiCyuAxMWyFQE3vlBazezJBAG9mbiFLAAwC/JYPR/gIQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1680690567; a=rsa-sha256;
        cv=none;
        b=VrJuQoRzrRMUPR5p19ohXeNyuKRT5fBxP8xGMop1rQifSZRGZmw7XZYT+JNnNq3KLWeh3x
        ut6E6uT7USEK4zPd0YsHwdRYwi3NygdiXJKkJLCl8sXXuLUkceSTcKXDs5AGib+bE6mxX+
        N6DdVB5IoT1/orb/xe+lRgCPZSAAhigqPiLi43E3LP2ntSfXMYTW2FctWLjIOcMRKnPsS4
        qPOW/h/saf0KC4plJV3eHQzxvWteRTNx9lNb1Da9ML7s+mMk66Xvxlsht9df4lQijsFad6
        Kjv0EJp4k15h9JYNFKymOLLYZ7y7JSaa0TnBPKYn4W1ZlrLRqhq6wS37Nk/omg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1680690567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7W0TFfp3Ay47+apvpECqJBYQ5lfPu8VHB4ob/VE5pJg=;
        b=tjqAx/QJDbHciJCULc7RIvYjQjf1nR4/uOzI7nRTp/wpCJv23n13bXACxMbtFqstNK63J7
        K1mGzKhf1i9tqkD0iy8oSSDAizbefpUW7wxEK5MXitaRemQUo8jq7dt043Vj6tRpIFLEfb
        b9NnOEPenVMdDqiAdcYALvyQNASIkxzFwikQQvscpj3INfGILAcXzLW2i++lx+qLYoKAIH
        XOsTHTJwBs1kJ8i7ZSC5yPNBSIgeUU24p5AoCXfDnRb7JFzDD6EV8Wu32Bfpd8eczYhjxP
        wtDG1Qbebn/YhZQ9SJyNFDQw/0rHbbNcmPXDr7vOr7XsvfnycJFXzxzZy+d1Pg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 77DDF634C91;
        Wed,  5 Apr 2023 13:26:49 +0300 (EEST)
Date:   Wed, 5 Apr 2023 13:26:48 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] Documentation: v4l: Document rotation and
 orientation for sensor drivers
Message-ID: <ZC1M6N6Tv7l+928r@valkosipuli.retiisi.eu>
References: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405101646.1804044-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 05, 2023 at 01:16:46PM +0300, Sakari Ailus wrote:
> Document how rotation and orientation should be taken into account in
> writing camera sensor drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Simplify language (Laurent's suggestion) and add note on flipping
>   controls (Jacopo).
> 
> - Improve the last paragraph, say this is about rotation and orientation.

This was meant to be v3, i.e. changes are since v2.

-- 
Sakari Ailus
