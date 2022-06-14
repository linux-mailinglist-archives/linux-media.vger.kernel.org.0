Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46A254AFE3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 14:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356278AbiFNMF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 08:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239833AbiFNMF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 08:05:57 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A82F2A420;
        Tue, 14 Jun 2022 05:05:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id EC3E51B001C6;
        Tue, 14 Jun 2022 15:05:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1655208355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3bs+EL5pqRI2xkjJ0VWmro+UA8ZNwkqG5vjDRwnY3VI=;
        b=ZhF1OozCuKbIzockNhelge1SCRp50o6Ps4aNzXklC/UUDNsjq91yNbfRisgVB1oAn3HATv
        mEBJPR8lhDA7UbBe8y5DqxWCHUWrhJYaBdRVifkbnLLS9KiHvmC4cdgBsW4j+aCtIDP08i
        ckSdU8/dc2LjzjITkTq96DCHlcmJUF3qct3Vnxy5GEWTYZKSUJqJsl2r809eUBAb4pUad4
        5q5B3ZLUefsDPkkw8ThhmdYXGzKaILB7/S2JtJ9s7OkmHSPpmULjMEISOGe6WFPRtpoRn/
        8K2RD5qRmRqJBTbrOS86OrNj3js/jLIlfOSE1Vq+1gnmjj9Cx3YfCJ++9naK/Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 88BD1634C91;
        Tue, 14 Jun 2022 15:05:54 +0300 (EEST)
Date:   Tue, 14 Jun 2022 15:05:54 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.j.murphy@intel.com, dmitry.baryshkov@linaro.org,
        konrad.dybcio@somainline.org, andrey.konovalov@linaro.org
Subject: Re: [PATCH 0/2] Add imx577 compatible to imx412
Message-ID: <Yqh5osOpT4BPi34k@valkosipuli.retiisi.eu>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
 <165463899225.186364.3363631428060807036@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165463899225.186364.3363631428060807036@Monstersaurus>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1655208355; a=rsa-sha256;
        cv=none;
        b=gLknAj0ixAsvxrOqp4zn9coXfpRiqL+59i/RmPNfWzK7E2zvo9QEBDdoWRTnDLlasD4AG/
        BDrUe6wxrJhfsSuUAt5XqCMqN/CxVbZFEKVV549C7GDPa6xo1I5oGJTeARyN2rsIFFkCjo
        tmUU68/torInodS6dil+HdusGZEhz0ArOdsNh7jzJMZmzQCe0TU9NS10QsJTDUlOLdBZTy
        z88t4t6x0gA6zLD8GT6Z+UyFje4B+j31yRD+qitt4PIY43/b3584V4YS0OPtX8X4D+UpEP
        R/g5i942Cf+d+W4ZAt1kMwLmvrRuJ7rj3Vtc2apafZBOJsHFINlV7Pqac0thpQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1655208355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3bs+EL5pqRI2xkjJ0VWmro+UA8ZNwkqG5vjDRwnY3VI=;
        b=JPfarZKl9pAq/MOaLy74JZRkXVXVG1OP17OQukKY786nVoJ88d+UXYSQvfNAipAY3R9QGJ
        lk1P/IIBaGdZNnYFnbCal/x4OUDrRjzyUGFLmNfvTV1kLfzO46EvPAwrj0FHMJfXL/isyV
        sK9JwIiiUmf4Y2+eRsJ796rok693eE5VWJ8uf5VOWMteuhlQn7VrRqmTfM8kzNNqxUSfWb
        +qkxVK43sKHcrVI9EkOqA5fvflGnhVHK0YqH3169vSlQFmprZhHiR1PNe1zYMWMVvFeTkp
        6xF/shsIH8497Ao/e9N9tqrksYhQldUPoS1IWe8SG1I8yoLbrPVniX/5ZrvenQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Tue, Jun 07, 2022 at 10:56:32PM +0100, Kieran Bingham wrote:
> So picking out the diffs from that:
> 
> IMX412
>  - Designed for Surveillance cameras
>  - Defined input clocks of 6, 12, 18, 24 or 27MHz

Probably the spec just these while other frequencies in the range would
work equally well --- with different register configuration.

The sensor might work with the CCS driver, too, with MSR configuration
taken from this driver.

-- 
Sakari Ailus
