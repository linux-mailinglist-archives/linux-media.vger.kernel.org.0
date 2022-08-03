Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4D458919E
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 19:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236893AbiHCRl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 13:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbiHCRlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 13:41:25 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BCD5244F
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 10:41:24 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 13so1300091pgc.8
        for <linux-media@vger.kernel.org>; Wed, 03 Aug 2022 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=learnwebsolutions-com.20210112.gappssmtp.com; s=20210112;
        h=disposition-notification-to:content-language:importance
         :thread-index:content-transfer-encoding:mime-version:message-id:date
         :subject:in-reply-to:references:to:from:from:to:cc;
        bh=cXg5X+uA6qxDW8/1xJO70PGXacSVP+5A1Uwqzedn3kw=;
        b=sxyTDjJkBbKczyTd20w0mGWHkNSJa+JFzhV06UcQh0u02v/2ZSbOaeUkZG38p3JfL3
         rFxuQOelPQ0Z2uu1wNI2I7ei6miAC8uvukaJPSZDMzBrswNXpry8SgDxjmUhbUW9V839
         WDWImuK9tl1pN4B11SxXVPR5PQpL0rVSTuQL7Lpw8CgvglrEVNJHuT6hQXiBgs14atbo
         PCqRhmgg86gMShORDMVJStZ7K/gfzw1irofsP/7OFTSaH/cSU1vnihIpC19O68qVqmiQ
         ok2ZRbGptJ0qy+KeS5YaOIRCgIRn20VEMb1joCcJHC1ateKmougXvzuopSyL/UEwXuvG
         ykWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=disposition-notification-to:content-language:importance
         :thread-index:content-transfer-encoding:mime-version:message-id:date
         :subject:in-reply-to:references:to:from:x-gm-message-state:from:to
         :cc;
        bh=cXg5X+uA6qxDW8/1xJO70PGXacSVP+5A1Uwqzedn3kw=;
        b=ivCXpCHW0/wO32lrlx+luu6gee6r2Xf03zDuyRkCnHwbPnaVkg84RphRFjX+kbwVwp
         /5OdtllyTuni0a+97gKF5CkebA6m/5LK55TT9V03Gj7aoEulNS0iesD0xfuwuogFIxk1
         RNMaatc9gn2r6RHishZ1/02eBP8fPu3yIYKODFVpmG9sFRYaEMTR87wfRkWzYSe+U7dT
         KENPNtHDj3ckDvwbCQ1KmTtW4XBBQDX7cwL9W/G4Mbc70T+aodMXXHA8h2/bdPl4ak1V
         CrxeJZagATJsR5LXVUDfk76GyxbccPSvPvhthKaC5c7hCJrsWJre/Uz/rmlbyY0Td04+
         foWg==
X-Gm-Message-State: AJIora/Q37aVx9GbX2sH2VhD5A8aWGSVMVm68BoVA6NXql3vCOiv7GfX
        uqSfoIiRqyJIDcs0DJaxqhs7Ng==
X-Google-Smtp-Source: AGRyM1scUnpGpa0kOMxfZ0NoTeyDgyDg+14TUcHDjjk/PMKdUZEGCOd4a/xO/7o+OrZxegVPpecyWQ==
X-Received: by 2002:a63:5c22:0:b0:41a:56e8:27d with SMTP id q34-20020a635c22000000b0041a56e8027dmr21669977pgb.22.1659548483736;
        Wed, 03 Aug 2022 10:41:23 -0700 (PDT)
Received: from DESKTOP4AFUDKB ([2406:7400:63:932e:b4f9:2304:2bda:4a63])
        by smtp.gmail.com with ESMTPSA id j20-20020a17090a589400b001eff36b1f2asm1885919pji.0.2022.08.03.10.41.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Aug 2022 10:41:22 -0700 (PDT)
From:   "Randy Rose" <randy@learnwebsolutions.com>
To:     <randy@learnwebsolutions.com>
References: 
In-Reply-To: 
Subject: RE: Verified ISC West Attendees Email List-2022
Date:   Wed, 3 Aug 2022 12:39:01 -0500
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAPn1QZ8K5M5LhK1kD4YMH0vCgAAAEAAAAKk/IATIFtJKgqvG2hecNNYBAAAAAA==@learnwebsolutions.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdinXeRB7uNmwNcES/qK+pm1E+XOTAAAAzfAAAAAHQAAAAAaAAAAABeQAAAAD8AAAAAOUAAAAA4gAAAADbA=
Importance: High
Content-Language: en-us
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
=A0=A0
Would you be interested in acquiring=A0ISC West Attendees Email List =
2022?
=A0
List Includes:=A0Company Name, First Name, Last Name, Full Name, Contact =
Job
Title,=A0Verified Email Address, Website URL, Mailing address, Phone =
number,
Industry and many more=85
=A0
Number of Contacts=A0 :35,968
Cost=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0: $1,529
=A0
If you=92re interested please let me know I will assist you with further
details.
=A0
Kind Regards,
Randy Rose
Marketing Coordinators

