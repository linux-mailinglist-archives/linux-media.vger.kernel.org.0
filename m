Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0024B9DC4
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 11:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbiBQK5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 05:57:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbiBQK5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 05:57:02 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C046589
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 02:56:47 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2d641c31776so27297997b3.12
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 02:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=cpSbBGiW1oecsaTDh46cMPmhTfaeE8yNhzSZ94AQOfU=;
        b=eQrMSp8OERWdmFwUN2mhyHWmWWlvIHfFZ/LhhOCiJMeIzMrS06Qx6HPBq9SMFbiB6P
         pilPThROa2xw6rhSXP6JMuVWF0qc8KhQ9I3j3n/IPlRro+ynVR6DaS4oLHRrdNeL3NE1
         jxb+8examu9MLFSwGZ+pPr0HQ1j/8uoWZ8X4OwZX5sXpiWc9fk7YHPpa253Yqzes+9zi
         WuOIuBcQeHpq6wGCOmJ0NqeqoLniRp98yBRmqBO3e+c9ZITt2K2wZE0D9KcEn5pTKh6d
         6jickI6RtG9AYPJyW0WbJmo9O1XUpTug0bkXOLkCXxoW6OEZ1D8A/mjjNCH/9xW1Krxd
         Bjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=cpSbBGiW1oecsaTDh46cMPmhTfaeE8yNhzSZ94AQOfU=;
        b=ALjUyEAZrQpzS1y3ztJ5F+mNDkz/9o4BkNjdCv318cUYbRMA7dipE9s7i91R2iQZun
         z1xExJRbpCUZ+NZHcgv8T/SuSyFIf8o7ytBSllwUKJCNOqZGVSq1jd+bzTpUOcJXRTep
         TlrIpTxBHvJ4XOCORFuspkONXnfkzCXKHXtZf4cdZVcdh+1HHrsYWuAV62vtmnIkEcED
         MwV3f6B1zKo2bLPJcu9eobJtYw/tlwjBIQvUZiU9qHlEKTpu4vOiiwsP9D3uPqHWYJjb
         13IIOhDpse6L/PXiTfjQFBBZISV1X4R+fcuZ+L1DOMv3pAM2CBbgg0WnztmREtSCej8v
         v4OQ==
X-Gm-Message-State: AOAM530hV8uoUOgqvE4fEgzHVaK8SLdVJJssuLOARoqF3BF0LLUuE9BU
        qhhYUhFFXu0CJ52pGeICRBaWq/spgn6dMGT99rY=
X-Google-Smtp-Source: ABdhPJwxzIoTJ6+outxFYk66yzPgoa8HQLSv34a37qJmZOhEdOUc0f2vPWN+oGnOpjFOtTiqjAlESVYS8656xKw29Zg=
X-Received: by 2002:a0d:ef82:0:b0:2ca:287c:6c5b with SMTP id
 y124-20020a0def82000000b002ca287c6c5bmr2008867ywe.256.1645095406751; Thu, 17
 Feb 2022 02:56:46 -0800 (PST)
MIME-Version: 1.0
Sender: zooswp.com@gmail.com
Received: by 2002:a05:7010:5782:b0:210:7067:aa25 with HTTP; Thu, 17 Feb 2022
 02:56:46 -0800 (PST)
From:   "Mrs Yu. Ging Yunnan" <yunnanmrsyuging@gmail.com>
Date:   Thu, 17 Feb 2022 10:56:46 +0000
X-Google-Sender-Auth: 4luFbuDHJQ7Am6p-LCveX7E3AYM
Message-ID: <CAPEdz5R56iZX+qHQpbvP8NtLy4qq0YAkaqQZHOeFSc5wvCpDRQ@mail.gmail.com>
Subject: hello dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        LOTS_OF_MONEY,MONEY_FRAUD_5,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hello dear
I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor said I
will not survive it because all vaccines has been given to me but to
no avian, am a China woman but I base here in France because am
married here and I have no child for my late husband and now am a
widow. My reason of communicating you is that i have $12.2million USD
which was deposited in BNP Paribas Bank here in France by my late
husband which am the next of  kin to and I want you to stand as the
beneficiary for the claim now that am about to end my race according
to my doctor.I will want you to use the fund to build an orphanage
home in my name there in your country, please kindly reply to this
message urgently if willing to handle this project.
God bless you and i wait your swift response asap.
Yours fairly friend,
Mrs Yu. Ging Yunnan.
