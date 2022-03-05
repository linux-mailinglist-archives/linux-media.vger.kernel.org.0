Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108B04CE4BD
	for <lists+linux-media@lfdr.de>; Sat,  5 Mar 2022 13:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiCEMVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Mar 2022 07:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiCEMVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Mar 2022 07:21:02 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EC65880D
        for <linux-media@vger.kernel.org>; Sat,  5 Mar 2022 04:20:12 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id p20so14374324ljo.0
        for <linux-media@vger.kernel.org>; Sat, 05 Mar 2022 04:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PAuhlXKoN+F1w1gfMETzhilH+R2APbQy2NKsIVQ13zs=;
        b=CkVfw7W3FefJeSVRUU8tMGHb2nmsq4VXfBNRppgZ7i0DP45BIOSqu5km55+XZAtyia
         bqlVElV/ZN+wW0hCcwtArzn6pI14Ptt4AEAt39bQdKRZdCiG1rQBLCJk9UQtjRq7k+m1
         CJxqctZiKiEOt3+jQljzR8Aj1QbkdGE4QdfleqFeNLltE5C+ztdUp68+Ar2fy/UuicdT
         oajnB1pqeohOTyh7Z1lrA3sJLfh+aSQYCbsE8E00+eapQetgf/6aXu6pfs9NJLkAmoyJ
         Z8G/EZGy59eAocyUeTiwBPnJFCIRAJmuQLBHd0A9QU70UhykADwOeUUJPw8JCqmi8RHl
         CrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PAuhlXKoN+F1w1gfMETzhilH+R2APbQy2NKsIVQ13zs=;
        b=rHbbSsd+BkLr66+BzRqeYYvDD25FvRnfMLF2DpE49iSIG0R2RMaaWMAfeqzcBVQTTC
         443DWvUwZa5fsBnkM/HWl5zr7X9lADU75GrHFczICpZBoxjYhboKW9Pe6aE1VX0889Ei
         CizqN0T8RvwGH8qVYzL68thbGlimmhB5wDqAnFI90KdD/fqiVcgHW4axvIAj257JtAaQ
         T8Nj4KGJWkGlAD07K9A8fQLWvwCCiWqRve7yRq89QLEIigNRGezZGvGmJJXRQzcG4ssi
         hdgOuDbbRy0+4fCm4dhE2xrz0qZuYNhavuHCgjpd64FGPkqvdQ85b4Gh2NyhATL8Zli6
         1zhQ==
X-Gm-Message-State: AOAM531tRPRuudmxKsEOnAT40WOqLw3BdPkW5CLanDmRYJbH/Ixl2vz0
        VEoMRlJvk1IgeO/uLiFcw+Pdn/snUvg7bMb22+w=
X-Google-Smtp-Source: ABdhPJx7/mvzF0cqplrafXz8EQ4IlbR+VYC6LtYbq8PLMBkzd2b0tHKW2ZCgwB8DRW20szEKgipaZqNIXh/3synlZe0=
X-Received: by 2002:a05:651c:230b:b0:247:dc20:6b6a with SMTP id
 bi11-20020a05651c230b00b00247dc206b6amr928229ljb.160.1646482807803; Sat, 05
 Mar 2022 04:20:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aa6:c20a:0:b0:190:7f6a:a9e5 with HTTP; Sat, 5 Mar 2022
 04:20:07 -0800 (PST)
Reply-To: fflorajones@gmail.com
From:   Flora Jones <mmjanee1@gmail.com>
Date:   Sat, 5 Mar 2022 04:20:07 -0800
Message-ID: <CAPrdfSa4b_zrYj6sJ5pS+zGAYvbcq4V2TyjhwayTa9h2mW+frA@mail.gmail.com>
Subject: MY MESSAGE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4996]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mmjanee1[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mmjanee1[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Dear,
I am Flora Jones, a widow with a child who is 7 years old. Pressure
from my family has compelled me to seek for your assistance. Can you
help me receive  in your account, this money is for investment into
real estate, I don't want to lose this fund as pressure on me with
life threatening is becoming unbearable. Since the death of my
husband, his brothers have been seriously chasing me around with
constant threats, trying to suppress me so that they might have the
documents of his landed properties and they have confiscate them.
Please can I confide in you, I will give you more details once you
reply back.
Flora Jones
