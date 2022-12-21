Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0BEE653396
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 16:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiLUPo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 10:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiLUPo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 10:44:26 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34E4E08
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 07:44:25 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso2457359ooi.10
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 07:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rothemail-net.20210112.gappssmtp.com; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7ljQ0PRVNsaQzBnhK+//xxNHtXSz0AiB9uFMAVKWRg=;
        b=yCHcokme/s2LkoaTFgBkfcaIjFKfLcsFIRuEXnMwA56i4tOtHVfNj9BBkogdpMPADF
         K/QDh7tYC17XJaVuwYnz8yOYl8JvuUVWA+uJE3GfvD0Mei5mhLtcpIEsLikz2hRX766V
         oMnhRwfu/SvL4MBdrynq9ah+8EzaNoCrn1QwG2oBkwLazLaEiR4KEeDq7+lgfadcMtbs
         cd07FaDhsOf3Ssyj3dEkF0ZB234L5tb3iD6Trk0zLrRd9apqHXpJcvbHidQ9hKsW1qUs
         dyv+pWv6P/h8TGwoQCJCNW//WqE2mqSdeL6pRhjfMtg3j3IRxcQaQiwUBLL16ETKKcHf
         WCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7ljQ0PRVNsaQzBnhK+//xxNHtXSz0AiB9uFMAVKWRg=;
        b=BDt2snT2LMm0cJEAVioT69IzdEyvWCM2F7um1cSmcNah8p0MSfCm6WiwX9H4LCcG1h
         oRKyVCDUZeX1ivbOrpU9AxVydLUWgBa3jNf4ojz0/rdzf2eZRbijR+BGYy3K/Iuz2rjg
         CB4cfmy6bnm/chmjq7qa6Cyv1HoFw4jKwqxWTmZZs8aSXzoI+7woGHtsLUMf83X8YGS/
         hk6UZ+eLN6157pmXPA5yYLZGASWFh4tCb4gPGxlfWeF7E8ExQUpLU4NdBK5fpD/4iwNM
         i8KPsNtDy3JjV4y13WvHILEZcDXj7tbkYTCeIcqdy5ZyXaCCWIb1AOzzZEHx/biWR+2U
         texA==
X-Gm-Message-State: AFqh2krDUbW/jIuW/62SQ2hEGFbLK2+mYRrxA3wJdk5jmGkqbJNzikcc
        81tcWe8wAWGHLNtPzmGulhRD1w==
X-Google-Smtp-Source: AMrXdXtqL6EIgkoGV25G45lkT2UHwoxZ96RhB8ltMMRqQQX0o+Y+qI1OSENiinTQSWAwCRGbcSn06Q==
X-Received: by 2002:a4a:edce:0:b0:4a0:b7b5:8f8a with SMTP id m14-20020a4aedce000000b004a0b7b58f8amr966751ooh.1.1671637465059;
        Wed, 21 Dec 2022 07:44:25 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:20:20c0:2cfc:bb00:cd38:4d57])
        by smtp.gmail.com with ESMTPSA id k14-20020a4ad10e000000b004a8eb1d8f1bsm6144751oor.39.2022.12.21.07.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 07:44:24 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Nicholas Roth <nicholas@rothemail.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] media: i2c: ov8858 Add driver for ov8858
Date:   Wed, 21 Dec 2022 09:44:14 -0600
Message-Id: <2F561648-4537-4B7E-A9BD-52EBAAC4772D@rothemail.net>
References: <c0f6b7d3-78ea-4337-f350-c9020c81f901@posteo.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
In-Reply-To: <c0f6b7d3-78ea-4337-f350-c9020c81f901@posteo.de>
To:     Robert Mader <robert.mader@posteo.de>
X-Mailer: iPhone Mail (20B101)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the input. I will look into this and see if I can reproduce an=
d subsequently fix it.

