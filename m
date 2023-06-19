Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53644734F78
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 11:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjFSJRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 05:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjFSJRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 05:17:24 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2699883
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 02:17:23 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ql40b6hnYz49Py9
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 12:17:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1687166240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=eaYiKhUSRI5sE17BBIa+FrC4lnUTPZCsig1TKfurh7M=;
        b=BV/T1NsnWfhubIrXhPd9pCjn7G3EerQN3gii/2FZMT2yAUtodOkBMZTAn535ZITGD/eDLw
        9dOzOgjKIowBq7Wt22F2ABuH3XIhib6HzvyUhxk7Tk/tkA48lAXcWpD880VIDXwHIXEAa+
        PvDXZb/MKqjJXLK7uG1Co+17vvct9R87m34u2zep/HBk89NXP8Ou5G0iLIU8V34+lJMirc
        ErYrJnrQiEkcY9T3vDXz0FjeNB/FPhrCL6nB6L1WVKxFytnYKmTyXMRVShLEXulp5XAgMv
        L41siqXvRX4DGrTTDmeruLPEIAo52zIImwv4F9C+8DPAeODRwpgGrxAEwAYEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1687166240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=eaYiKhUSRI5sE17BBIa+FrC4lnUTPZCsig1TKfurh7M=;
        b=P7a98wfuAO7ZzqNkru6Yg0Ek+dRd+LDjBO015vHgE2v5gA0a6cRgvGS6DmI/4J/wWaXq26
        faWTeRrO/JcHwU93yD4toscJXzKXms0tkz7uwajEdGGFmEJabZJS5rpjTeILeHdyJ4TNsP
        +aDngQmTz9jJ5gce4R8gklTsGLW00VZO1JnwxVNg8K3dnf7p9CdUQbN7QUr6VQmqGsVa2+
        GqJwJmqbJmnen9MLODRAqJIIWBt0hEoOCSGxrxQyhTHzI4B1I/LClgbSSt9v3c6oGmdoJg
        WQKYQ0LxXyhxCURdEELPoq2EsrTGPgi/4q/FzInLFftxBerV31iNeMoFOa2Lbw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1687166240; a=rsa-sha256;
        cv=none;
        b=PKuK1Q5vPcRj5itDRTX3fpZUUkpam4+IeSR3EO11ICsGJibDWzxZ2G1t0FEHiIgQNNIhCC
        TlkU+qKVxAPbwIlb9ZZTIPBWWxWVyy1+LFaKWydUhxT+4zqxgrhHTnxAsj7ZRDH4qRh1tb
        s25Y20jPAHgLVAj1G6ztiAtYVSOkpZ0vssK8dzU1WRRS6YCZBapQ2KejcLqhgd8iHrKzzX
        FJQEVJWGjhb6rpeLgfwJdRhCY0o8GOKZuFqTcIzgjPTrMm4nBelaDl72iVFDYUVf5WTJhM
        RQnWmBo280Lb2ELFjq/47zPLtGqjJOVxbsWBWPuVUzQdPIhxiLiENhNSuK1tDA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 53C53634C94
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 12:17:19 +0300 (EEST)
Date:   Mon, 19 Jun 2023 12:17:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.4] Fix compile warnings and errors for tc358756 and
 atomisp
Message-ID: <ZJAdH+Ftqyd79QF4@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

These two patches address compile warnings and dependency-related build
failures for tc358746 and atomisp drivers.

Please pull.


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-3-signed

for you to fetch changes up to afbb61fca19be4eaf2cfacece749f2815686dde0:

  media: staging: atomisp: select V4L2_FWNODE (2023-06-19 12:11:55 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.4

----------------------------------------------------------------
Sakari Ailus (2):
      media: tc358746: Address compiler warnings
      media: staging: atomisp: select V4L2_FWNODE

 drivers/media/i2c/tc358746.c          | 4 ++--
 drivers/staging/media/atomisp/Kconfig | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
Kind regards,

Sakari Ailus
