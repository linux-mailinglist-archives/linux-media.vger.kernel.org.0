Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93DD1613AC5
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 16:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbiJaPye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 11:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbiJaPy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 11:54:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD5912608
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 08:54:27 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d26so30452057eje.10
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=ggQuzJDmtFt6ASf4MAUPpLpVRWq6C7d6tt/xb2JvHAUqilqDuKCKdgzoD+ZHtcZ4fq
         1eGGH4GCkwFmv29dMVSA+sfIupMAQoPy3Udm0shqfwmjwPGRMgse5DloY6LJ1rN88fY5
         7w6hrxuUesvdnXYoKXWNpBj8Pr4Xr8VccPz4cuzn5bfujDLgEBPPC3xuLT0jbsm1ipxh
         FUhqBkZXPIIrWP2PsdxLUGOhzhmQjhACQa60SJn3FJ739vynVm2k1qMYY8Csfsj0y2lM
         nw2YA5xx80yJfSa/JhPpfgs1o84qgLa+OLcJIGH+THHb6qZkx3Z3XMPBiJeb5RsMIDTj
         0+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54IXG2FPqhGXRhjbMJeBZJCoE2PKYVWz3wVMDeZTLCU=;
        b=j4wnoEzipoH7qBgxFsC/V+z7HDUfBBMmAQBchcqqe8K8s3+P8QxWdsnAgE5PeMia6Z
         VV0ZekmPFkeZjE9MtFCDBrugzhFMfOeh4FF2rM5jif9LdWyvMWpKl9KcfkX5RjxdEFZe
         sXLxwgySBcA7r1Hzge3koS4/BK6n8UpMQOLxvi3Vqd8vRBhd9jL7Qpg6wP+lTShZutlz
         szX6W+SGqyJHcrNRevVRmAkwUwoQodTJ2Pi1GdOKqdwiXegNkPItfyx2/QWRPtUTZz66
         Tqr5sslwr8fF0sYZB41bmExg2wCgoxB1Zs9ya8OvKCpWxYFhRdwcE3gW67k8DfdYFFjX
         Umcg==
X-Gm-Message-State: ACrzQf1flYw2hP0Wt38qBa4FfgG/3WREltw1x2i3xxDlEohCLflYcjva
        aHbQClxEKi1rN2f0nR2OwaFZNxenjcDgkYlOsH8=
X-Google-Smtp-Source: AMsMyM5ij4ZkrsD6JU9uNQElQEIR/nCACjnjtY6wVFIdrV6cBJv1SK5jJ5zr23msglTQ3T5SKFNEM5GHVkDHr+Qm+NE=
X-Received: by 2002:a17:906:3054:b0:7ad:e82b:ac23 with SMTP id
 d20-20020a170906305400b007ade82bac23mr282876ejd.235.1667231665911; Mon, 31
 Oct 2022 08:54:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:608b:b0:5d:5fd:eaac with HTTP; Mon, 31 Oct 2022
 08:54:25 -0700 (PDT)
Reply-To: victorinaquezon01@yahoo.com
From:   Victorina <victorinaquezon@gmail.com>
Date:   Mon, 31 Oct 2022 15:54:25 +0000
Message-ID: <CAAOoKduTk21eCti1a2TBD7guF=FZ3iOogb8zsgEqi1wEJNe+NQ@mail.gmail.com>
Subject: Good Morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
I am Madam Victorina Quezon a citizen of philippine,A widow
I am  woman going through so much pain and suffer and might not walk
again if nothing is been done fast
Please  I want you to help me retrieve the only Thing I have now in a
box  which contains my jewelries and 585,000 thounsand dollars   which
 my late husband left for me which is currently in a Security company,
I have no strength to do this due to my health condition and safety
Please Keep this Confidential
I await your response
Please reply me at     victorinaquezon01@yahoo.com
So i can explain more
With love
Victorina Quezon
