Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CED466B45E
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 23:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjAOWhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 17:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjAOWhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 17:37:42 -0500
Received: from mail-yw1-x1141.google.com (mail-yw1-x1141.google.com [IPv6:2607:f8b0:4864:20::1141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE571B567
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 14:37:41 -0800 (PST)
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-4d13cb4bbffso238572257b3.3
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyQfDA5JQKapTqk95xlLXJ5aD/AVTOh+bnm0DaoViy4=;
        b=oQP9mdly3JNuKjunrb8YFoTE9zzEZpQCR0rWPkDbqOm28eyh8cjWpNjx/IR9WBEMTe
         acoH8WWzVqrgqEilB5HgjaZ1C2EljnlST2kB0LwsncAfsHHiTkKBCzsT/U6ISmf4cqXH
         ZaiPwX2GZoThUtrEeTixaC0WIx14rYSgwQVN5ojcCBZcbai4AQ1hPiB+1ztyrgplVJyD
         4fhKBnIkiiNd9gD3BDZSxBWS/7vP5JnTytg1CTzz/Nrgx+vvUYGWAmxanpMuhoiZK8sJ
         6guUocbJl7NJCsYCppMk/ZBcl+aC182k3xlRvLBzZFbhlzO45nOkxu/xqV1r64h4x1Md
         hKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyQfDA5JQKapTqk95xlLXJ5aD/AVTOh+bnm0DaoViy4=;
        b=F6JAcz2JMdF56YHqqO9NTeD22rGWA0FxWd2KLPUYdAPULZu/nEPxk4v3KdFyp87awg
         qGuOn/Vz4DrFAI4Ht0zEAV9NL+d2zCLgz4d76RGNOTbmnSszWwQMAQGsj8zrQHIwALSW
         /ramjEUuGgnsJqBFD78v5XloIqw8bOSPqSFKnYX3MraNiKmE1cDLk+C3AWFWKLhDYeoZ
         nGDXK2JeWsmI0YrTbVy3B5DTkyuEYStE2sg43VcyS12vErlFxQ2LW2JUFVwdKkzeGUdy
         S15OuOCxBfk7X4fU0dG0RIgCqqFkc5ARLbw1w2lt/aP12S/lYlSZWMqujHUjlmpsdSmQ
         v9zw==
X-Gm-Message-State: AFqh2koMENvtdw84JZMNEBgpp9LHz6eOjQuKAIW1CFT2hQdl+/j4i9zZ
        KESKL6CELA0ReXZ7/KdAtUeMZcPGOGorrvQsmTg=
X-Google-Smtp-Source: AMrXdXv/wsP49Q7RF9fMkDv9zVs7yaP+dP5KW6gHBuzy9LRg3paCSs+ziDnaCQGAu/BEfx2PVsPEY2MPgp9JWygG630=
X-Received: by 2002:a05:690c:dc2:b0:4ea:8aa2:8fb3 with SMTP id
 db2-20020a05690c0dc200b004ea8aa28fb3mr318271ywb.209.1673822260116; Sun, 15
 Jan 2023 14:37:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:418d:b0:321:e0ea:646 with HTTP; Sun, 15 Jan 2023
 14:37:39 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <gracebanneth@gmail.com>
Date:   Sun, 15 Jan 2023 14:37:39 -0800
Message-ID: <CABo=7A2ZzDEB0+jXzCbP3t2LuMJfAhGCqO6=uuo+VPUgLgU=mA@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gracebanneth[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello Dear,
How are you doing.My name is DR. AVA SMITH from United States.
I am a French and American national (dual) living in the U.S and
sometimes in the U.K for the Purpose of Work.
I hope you consider my friend request and consider me worthy to be your friend.
I will share some of my pics and more details about my self when i get
your response
With love
Dr. Ava
