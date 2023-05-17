Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBA6706A88
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjEQOGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 10:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjEQOGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 10:06:23 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638F5121;
        Wed, 17 May 2023 07:06:22 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QLvzJ2lxDz49Q47;
        Wed, 17 May 2023 17:06:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684332380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pnnedaRf5d0O6ZpnpmsjUmMQN/bFtmYnyxnHtn38E6o=;
        b=q6Z3A0QqmMZzHo140Npto+hSoQ9wIxpx5NAtVRRlvmzEEFA5o3G0p6O2xfKh6UnCyNNO7r
        fQ7xjGvd42s+g59ReKQgdDHeUkB7Rh6DgA3bAmAGzUKc8+6jdTbFusjYx5nQuQo4e6H/m9
        m3N4xPWIM8WRCT/4HhoLXtSoWsPUG3HlkcDg5ltswy8J+JymU62J4/Cl9jFRJbCNSSFiQs
        VSWXSM3ju7UQCYQC7MXzXlQmGnKjlIBitYRSyDhxXtLKqopN++DhsBT2mvUmSiLs0X+vJi
        Er3kijcXdTAfGqzJR+2aO1XgOTGu9vlyc5E4Evu8BmbD2bV82TaBiChx/TSf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684332380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pnnedaRf5d0O6ZpnpmsjUmMQN/bFtmYnyxnHtn38E6o=;
        b=ivBRW7jQJZ2aYu7fh/tfw7Ckzm0XUt5OrWjU8fBlPppHYgcpAute5hpPBo7YDUh+6u6WfV
        SaMSc0t9662WfWC+YiI1HSg8mwrDD/NBLiLMJgiqhJRQDx2YfG7AoyR50FETw/UNbKVTGU
        7mKS5SBToEGGm8t8k5cc/eBE//8yvpufLOVFyJM/uYgFvTG8V25XKQnJmBJ0cB8i3VdPq3
        75lqVwuRszVtp1pTVEX/l354pjRdDj6Pa5bVB4552DqaF8DIZSGuYtlXKkeWF7g297l60n
        FQSlF2ZdvKje+g5TDyCFQzW5W8hVFC5Vnp0L3FmEGNMskkN7xziRnDbT1EjQcw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684332380; a=rsa-sha256;
        cv=none;
        b=M9YoyZL/gJl0KLyA5mFrftuyI2mQIMxj294ZRtcPZlQiZ7zj0XB8Nm7J0Ny2oYpk2nSrLt
        Fw+/I8Iz5umDu5uGZEZ9ItoH4TSz+BHsc0MGmHLHcM6NyY9uI1U1gN1y+CPYLOckV9GQ5/
        gPNH5/xm19/SzwE/6GrxUXt9Su/wcaaCzJL+Aq47ZzGbQCFHNukMJsnF/FiVwKJD6LAewV
        EZ3X76eeOAINF7vsPz+ZYs31Dd5OXarT8+Vr9pZQhSitDSubzK3FhJ5GhlgmmQ8Oa4vGX2
        I4C6Xg7RVZOWROR4SCX+6F4b2LehBidZAIR2UnBVELSzke5NB5w9AbkDzq+cpQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 09C88634C94;
        Wed, 17 May 2023 17:06:20 +0300 (EEST)
Date:   Wed, 17 May 2023 17:06:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: rcar-csi2: Prepare for C-PHY support
Message-ID: <ZGTfWw/Gt51IrmiN@valkosipuli.retiisi.eu>
References: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
 <20230424185934.438059-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424185934.438059-3-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 24, 2023 at 08:59:33PM +0200, Niklas Söderlund wrote:
> +		dev_err(priv->dev, "Unsupported media bus type %u\n", mbus_config.type);

Wrapped this while applying...

-- 
Sakari Ailus
