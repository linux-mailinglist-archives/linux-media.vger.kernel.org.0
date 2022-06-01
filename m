Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61BDD53A2E4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 12:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352182AbiFAKm6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 06:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352177AbiFAKm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 06:42:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564286FD06
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 03:42:54 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id f9so2957222ejc.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3y2tIbRbDRhv23mbK5Rqin+P8ZWVAzhhqGGCptHfoZY=;
        b=qAo4Z4PSMtANTomvMZTLvhp4v5n0YhbnDWeLGF3mSfDjrQUGxl8hCkBQTWinRMS9yJ
         9Ed5fvAVeBfskaBkdnPtX/stO5dQHQ8UkprJ68AXTU2F4LtRmnp5kJhNJsEAf6tD2y+h
         EqLmfaZW+V/FdR1SsyMG6L1zxYdMOk8wFOJI55L3AAWskKotOpBuEaAlUXWFaMIFBWVn
         eaBr+i7pKWaf/Ytl2qg3JyP2Z8Lma89U2kt14+tfolGb7qvpk0a81RsDbh6976r+KK6P
         ywdw6/f6zWwjplEN/clL0wfLEZWrftMqj7oL5JrXS2kVwSHHQTbyUjprCIbH98brcCeN
         l19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=3y2tIbRbDRhv23mbK5Rqin+P8ZWVAzhhqGGCptHfoZY=;
        b=2kg+69wtAJmogER1VmfTgQ5U+hrBBvCBGFeDkScsVkJWFwiulhOMRYo03b8jAVa9R5
         B37G9YMpnHYpWIo98dLUPoa3aRD4iEWMKMpEV++QY/WZosxGaK/R1XXlDlPqWNqZNFBA
         Iec36Nj+GDPHsqt8VOyKrocpcCD8UK1xteK/XJDT68vZaTNjq73WzVt43HZhVIWsplfr
         iUNUZmAiAeXt87MEnr4dptxQidU26/z2aNeyRTWRvP7Eh02UeaII1GZL14SX7SrH7wG9
         aGel9ehGLgAZUoF96pORt2cYRJWNCHBjov8tzBkPoaYeSin7t2S4oq+SZXVPo7EswVYr
         8Fog==
X-Gm-Message-State: AOAM532xIgoX3RuxG62NfR+CZjY5nJmKsXTjHdj/ZDDxTWVxPD69iQC/
        miALKpFh6uAPB2bAeFIXBvsMOvNFdlUxFW+Gsnc=
X-Google-Smtp-Source: ABdhPJyJzVp6tUSxSY7g6VBbkfsMwRCJkev3coJx3/B+7PRLd4Qflq0faNyeHo0nHfQqxx4Q1qhVlRpQolWx+eOtnbA=
X-Received: by 2002:a17:907:7ea2:b0:6fe:d945:7fe with SMTP id
 qb34-20020a1709077ea200b006fed94507femr38714494ejc.228.1654080172807; Wed, 01
 Jun 2022 03:42:52 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: adakporose2005@gmail.com
Received: by 2002:a17:906:6988:0:0:0:0 with HTTP; Wed, 1 Jun 2022 03:42:52
 -0700 (PDT)
From:   Kayla Manthey <sgtkalamanthey@gmail.com>
Date:   Wed, 1 Jun 2022 03:42:52 -0700
X-Google-Sender-Auth: J6cSiJHN4LtAMPZv3I_68o6c0hU
Message-ID: <CAA4NdJmj9N9YqGSMs7JX4WRrftcK3RdDoz=9mr_5kVPLW3CRCg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

0LfQtNGA0LDQstC10LksINC/0L7Qu9GD0YfQuCDQu9C4INC/0YDQtdC00LjRiNC90LjRgtC1INC8
0Lgg0LjQvNC10LnQu9C4PyDQvNC+0LvRjywg0L/RgNC+0LLQtdGA0LXRgtC1LCDQvtGC0LPQvtCy
0L7RgNC10YLQtSDQvNC4DQo=
