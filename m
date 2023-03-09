Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6856B2CCB
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 19:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCISTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 13:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjCISSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 13:18:55 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929EDDDF12
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 10:18:45 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id i34so10570523eda.7
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 10:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678385924;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vtIQJgbAqYVFrKRDt53NZIcLU46fTuOZj8Pktv++Ns=;
        b=CQpdqMeCkaA/z738+UU2fGaN5/xdqU2BEwjNW3UtdOo0fjGYRWL+8yQRIJrvSOSsAY
         FE0fu04hYzhYHlRBePo7orOcrHQptX4fpyl/B+k6Ea7+qVO7CekGGV1XVIWW1C9RbFAV
         AQLdewzdyWSJQ1LwbOPDkWE79Ea3CfHFvfv2TA2OH8SfdnZBvxZHVdnFPGJNa0IL7VYR
         S2XW/RwFXi2x10DXo3bYFOKYjz8ddhwKSZyhYO5JOgFBEfTMcTO1eZBkao8pbXbPVuX3
         fkhAt/dlcPaHdpz2NBR2/cEVD4KW6hpG9/2Ux2HDqjuRZDisBYPR43UE9hq7/GHFqPip
         nnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678385924;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vtIQJgbAqYVFrKRDt53NZIcLU46fTuOZj8Pktv++Ns=;
        b=PnhydkD4xVTKhI3e2ihA634irSuNeCNXrUAWYJTy3czVedzlKLL4nS2cc7ocNaEqH8
         b5IAYw+hZWADu+sYO33De3s2wPhgJpNhOXtRnUGyCQcqyt6qPov6afxEJtHDxS+3/7F5
         A4fMs0E/uVIE3VPMH5fKzR3ukXnZOP8jsZuX/2B4R5qQW7xb1rKzJvGuYOnc3gFqZlzB
         O+70txkjE9rm1WofNEmzSgSrGwJJMQXSJbcasWQo2kb0SistpkAr1JMXPKPbjVD5yjUT
         tqBM6zJ/GLR9PyH293Kixu7NTh7pThx7KybthLMjtvPW4IxeznQq4VqlEU34QtTccs3W
         OBwQ==
X-Gm-Message-State: AO0yUKXlLzwtJnWzJc48cuQRZuk0xb18MxdHoCx+bavPXGdDnMKD0fFJ
        IWw95+l2jQVjZLiL8blFpVtVw2/BR1O/kuIU45s=
X-Google-Smtp-Source: AK7set8RsXIuhe+zqZlcmtgoO5ZNtkK2QN4WkgIrvcPHsX6Yw2MRHrie00YvsaWtcVMBMY11kWDdTDnMDlmrGjiv/x4=
X-Received: by 2002:a17:906:5910:b0:8b1:78b8:4207 with SMTP id
 h16-20020a170906591000b008b178b84207mr11837569ejq.3.1678385924251; Thu, 09
 Mar 2023 10:18:44 -0800 (PST)
MIME-Version: 1.0
From:   Lara Geni <larasecuredata@gmail.com>
Date:   Thu, 9 Mar 2023 23:48:31 +0530
Message-ID: <CAKDenP309B-vZN5AJRTRZ+PNDTwmOKhGEz9FnFPvw3C5E0GJBQ@mail.gmail.com>
Subject: RE: NTI - American Association of Critical-Care Nurses Attendees
 Email List-2023
To:     Lara Geni <larasecuredata@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring the American Association of
Critical-Care Nurses  Attendees Email List-2023?

List Includes: Company Name, First Name, Last Name, Full Name, Contact
Job Title, Verified Email Address, Website URL, Mailing address, Phone
 number, Industry and many more=E2=80=A6

Number of Contacts: 12,639 Verified Contacts.
Cost : $ 1,638

If you=E2=80=99re interested please let me know I will assist you with furt=
her details.

Kind Regards,
Lara Geni
Marketing Coordinators
