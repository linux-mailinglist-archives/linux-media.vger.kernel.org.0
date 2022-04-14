Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1CF450124E
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbiDNOZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 10:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242957AbiDNN7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 09:59:33 -0400
X-Greylist: delayed 3333 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Apr 2022 06:56:05 PDT
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E2919284;
        Thu, 14 Apr 2022 06:56:05 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 755B02008B;
        Thu, 14 Apr 2022 16:56:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649944563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pzWMTLC6LFaR3H8Uy4uBjTgIQEPZiQVD5nKLVZZb/4Y=;
        b=HCqHMuJ6Lz2KcRmpmEEbv2NE364UE5FfLBJmWjPyozDxEMR/YZk97XvgrF3LIJtkGBcSVS
        UIQgq9qayF4YDf+Z1rw54RdtWCdAiRK/t00YfPa5o3PgFv5n4j/wMXo0hNZJ9rHN1Lzva3
        I4BZmNU64G6bClA9IqLUYIpM8Qk4V5A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC72B634C91;
        Thu, 14 Apr 2022 16:56:02 +0300 (EEST)
Date:   Thu, 14 Apr 2022 16:56:02 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Message-ID: <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
 <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
 <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649944563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pzWMTLC6LFaR3H8Uy4uBjTgIQEPZiQVD5nKLVZZb/4Y=;
        b=LAy0w3ICvTs2KQ73+5QHFjnmD++eSIn/B5Cet5WFhRRIaqSklmQPO9ALao5VRL16Fc7FvP
        cUVXdvB0fBnyES0c11BL49sUqaQC8a0KgSpBmV1feA1j4MsqO3B0m+5cd7uNr9XUfVKKYg
        VIwHs0KqNMBEo9jqXhrNu1zbPFzVMx4=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649944563; a=rsa-sha256; cv=none;
        b=F7bi+vVp7kwJTmE3buqm5LIitDoz9hHN/EaaySvkK1l18b58O7Nd6WgK5gPQpfID7vnQys
        1Xt9Dk3juKz+B/B/38q+ytCNy3eucExoUfMfRg/V+CHsEP/pfXDXwJj7+B/pao+XouXzS/
        qeqwSgiwq1fbPoVWi67lSAz24d3QxNc=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 14, 2022 at 02:44:00PM +0100, Bryan O'Donoghue wrote:
> On 14/04/2022 14:00, Sakari Ailus wrote:
> > >   	ret = clk_prepare_enable(imx412->inclk);
> > >   	if (ret) {
> > > +		regulator_bulk_disable(imx412->num_supplies,
> > > +				       imx412->supplies);
> > As the function already has an error handling section using labels, this
> > should go there as well.
> > 
> Are you asking to move regulator_bulk_disable() to error_reset ?

No. You'll need another label.

-- 
Sakari Ailus
