Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE757108C0
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240379AbjEYJW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240682AbjEYJWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:22:36 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E104E4D
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:22:30 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QRjJ04LNNz49Q1p;
        Thu, 25 May 2023 12:22:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1685006547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FvA4Nepuwsl/NmNtrb1OkKkx/TKchmbg6up4Kys0PKE=;
        b=Pi2z+sHhqn/pj5fOfBCNtfrXlYSGVaLnmnDjRw5IzJZQwSbzOPSQuC1KU/Kjg5F0exyi6b
        RqyaJkCvIU+lmlSy+Fx/D2RlATYVYP62ats1kZ+AXs3FKT5iNQ9FAajsIORHh64imxJAR3
        uaU7jH31/zS53Hz17sU582Ig7u0ghoOfoYjKyz2wq5iN3cvlKF74Eeyamy/a1xD6TW+AvG
        FZIevQy3FGV0o6AdoU5WNV2bC97xyrHX74PA54edCOYcArErvCY65IykUIixa2Ot2EGglf
        lya8B5QxkFQEjDKHfSrW9uDig/2nBW6U2FOfC61MSjA3ExohEIs1cSJuEnzMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1685006547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FvA4Nepuwsl/NmNtrb1OkKkx/TKchmbg6up4Kys0PKE=;
        b=eJa8DOJtynf+VZJE3qwnQBzaDBOWfB7qejHm0rnPihOnG1m8mIHgsCk0jnst06ntTaM2GZ
        6hF/jjJP1YfnRIBPrl/79BVs18iYRXkwWiRk0FZAuNtI6G9J67t1LDSHtn5tjXquykvziE
        We2vYP+EioWk34fveb0orHuZb/YwIiMgEX8WXbULEuP657MCfzZ79KtQWMfojccLxUO4Ep
        TMIXNeSZ5z2WrWPF0fDUhHzbmz2vnJl1F4dQrn/IA/yJPGbSNYB0l4zXDEQIMrg8CIlPFN
        ajucvgh8oIWCC3Coz0hN5hbUjUqFHjDe/tLvAt22+acnSE6CKeul8P2SZQlsCQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1685006547; a=rsa-sha256;
        cv=none;
        b=ohhGrvK2JVXNEAmbnRgn+z4BbRjGXYm4EAs0z2dTflZElLqbwgtiBjwHlf+mH853dOJ/G5
        HgjbfZ7MZW2H1VjIJzfMVANt8mbkxHxAsplbuHaRH+FqdJjG4+xxW09O6+Wwvk1R0Ecz2V
        fCIEI6Tgw8o0R3ZInwBAaw7l0IqNG4owv821EqNBpfrR1ePyk00egVN8461PMIZ8MdHkxu
        F3wb8bPOhLgcuVCXJllLH84a4er5P3jMCAJ6mWkh7qr+HP9w7PqPgMJSvqgZJ4HqhZsuL3
        w2BJNCwdMeKOapQPqK2wyk2uF0h/zygLPUqrZL3CExUTMOaQXbzskUcdaaVl7Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D35F6634C92;
        Thu, 25 May 2023 12:22:23 +0300 (EEST)
Date:   Thu, 25 May 2023 12:22:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 00/32] Separate links and async sub-devices
Message-ID: <ZG8ozymtuT0B3OT5@valkosipuli.retiisi.eu>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 25, 2023 at 12:15:43PM +0300, Sakari Ailus wrote:
> The code also can be found in my async-multi branch, on media tree master.

I meant to say "on my linuxtv.org tree":

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=async-multi>

-- 
Sakari Ailus
