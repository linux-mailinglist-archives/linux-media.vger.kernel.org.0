Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9C33D797C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 17:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236817AbhG0PNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 11:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbhG0PNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 11:13:41 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071DDC061757;
        Tue, 27 Jul 2021 08:13:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id e19so22557857ejs.9;
        Tue, 27 Jul 2021 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCFwMIpBzowoo2IqUOmSvylGJxh1OmGjndAtWm1Zyqs=;
        b=JWdoxtBg2jFIavbWi8CQkEIsfhxKJ6xG95oNZxhxMK0vI0P/QJGn/0Pc2swhHHLppN
         YjOLOTrj41vh9X80VywrNfNmsvABAtBxTFz0q+PK58ylgl2ATvxm5At67rEpNYUqg6q8
         5UgRF5ViceiMFFYHfy+ZjBOxF0pxL/qw2+ASd+o8Gy2XdYeHROj7GP40Dykj5Jx8RKij
         P6hQb3z7IGQP6AnPPQ9qrs2vQzkxLyarxk/RQQn4Z6nmVqcg0kndA+CNr+z7INWVYF6o
         4KlqEupfpia+oNeC/SASMhmsfwWEBm0VDit7hlba4m5PAO9bIShf6z53M2Qp+wRdoRoJ
         41NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCFwMIpBzowoo2IqUOmSvylGJxh1OmGjndAtWm1Zyqs=;
        b=Tw87/qKPQxyZWWlsT32w1Jze7JBVojvGoTAePvXQQ0ao+zURLO3MF2hklxGA+HVEeC
         PAqH90/Y5vswPYdl/pqOquGhI+5cdqhWqPPfyJrRs2JKTo1bH8Q1PzjIouZ3CAPB/v1N
         qT9vOhZbaK1Fz5UjS+wl9tiVheDfZmWc1HdgSAcYVRTiqcI4D8t2PBiQBBEWzrnP/52Q
         jdp7199hVrZIOHGxhVJ1smpGc1uoK+oAcZjGb5f9w0SPHLDIC6hRc7ej9qyA6Pf5S1GJ
         ovtfgAWyVN00LZFmJZ/fJi8oJhVeU7JY6aZ1Z73ZerBy+ZWIXLjMsr6730RPMPTm28iU
         uQNg==
X-Gm-Message-State: AOAM532FFQ7Rz9OwdswWpmgXS0wS3dDem/zODP/I9p2Si6iJFAe4Clr0
        lPyQRAXcd1v2oMcaP0ESFZWaSQ1WY4S2sz4uFAw=
X-Google-Smtp-Source: ABdhPJy/v+3pFZzUvS3qCMqO4AMrId4I1a54DhViIom5UDpFys9gBhx5Jhw7ofqz4M10GIFN+i38YtdhJuEDdE0pxr8=
X-Received: by 2002:a17:906:9b1:: with SMTP id q17mr21950049eje.546.1627398819578;
 Tue, 27 Jul 2021 08:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d068cf05c716264c@google.com> <20210727100151.2051-1-hdanton@sina.com>
 <20210727141455.GM1931@kadam>
In-Reply-To: <20210727141455.GM1931@kadam>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Tue, 27 Jul 2021 23:13:13 +0800
Message-ID: <CAD-N9QUz_7pxAFda9QYjhJf6tGLYvHr7hF_qZ3DmtP=J_yqWAg@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in em28xx_close_extension
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 10:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jul 27, 2021 at 06:01:51PM +0800, Hillf Danton wrote:
> > Along the probe path,
> >
> > em28xx_usb_probe
> >   dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >   retval = em28xx_init_dev(dev, udev, intf, nr);
> >     em28xx_init_extension(dev);
> >       em28xx_ir_init(struct em28xx *dev)
> >         kref_get(&dev->ref);
> >
> >   kref_init(&dev->ref);
>

Hi Dan,

I have developed a patch [1] to fix this crash. Would you like to help
me double-check if it correctly fixes the underlying bug?

[1] [PATCH v2] [media] em28xx-input: fix refcount bug in
em28xx_usb_disconnect  https://lkml.org/lkml/2021/7/19/263

> Good detective work.
>
> I've created a Smatch check to try find these.  It uses the fact that
> Smatch creates a bunch of fake assignments to set all the struct members
> of "dev" to zero.  Then it uses the modification hook to find the
> kref_init().  Those are sort of new uses for those hooks so that's quite
> fun.
>
> I'll test it out overnight and see how it works.
>
> drivers/media/usb/em28xx/em28xx-cards.c:4086 em28xx_usb_probe() warn: kref has already been modifed (see line 3979)
>
> regards,
> dan carpenter
>
> #include "smatch.h"
> #include "smatch_slist.h"
> #include "smatch_extra.h"
>
> static int my_id;
>
> STATE(fresh);
>
> static int get_line(struct sm_state *sm)
> {
>         struct sm_state *tmp;
>         int line = 0;
>
>         FOR_EACH_PTR(sm->possible, tmp) {
>                 if (tmp->state == &undefined &&
>                     tmp->line > line)
>                         line = tmp->line;
>         } END_FOR_EACH_PTR(tmp);
>
>         if (!line)
>                 return sm->line;
>         return line;
> }
>
> static void match_modify(struct sm_state *sm, struct expression *mod_expr)
> {
>         if (sm->state != &fresh &&
>             mod_expr &&
>             mod_expr->type == EXPR_CALL &&
>             sym_name_is("kref_init", mod_expr->fn))
>                 sm_warning("kref has already been modifed (see line %d)", get_line(sm));
>
>         set_state(my_id, sm->name, sm->sym, &undefined);
> }
>
> static bool is_alloc(struct expression *expr)
> {
>         static struct expression *ignore, *alloc_expr;
>         struct expression *right;
>
>         if (!expr || expr->type != EXPR_ASSIGNMENT || expr->op != '=')
>                 return false;
>         if (expr == ignore)
>                 return false;
>         if (expr == alloc_expr)
>                 return true;
>         right = strip_expr(expr->right);
>         if (right->type == EXPR_CALL &&
>             (sym_name_is("kzalloc", right->fn) ||
>              sym_name_is("kmalloc", right->fn))) {
>                 alloc_expr = expr;
>                 return true;
>         }
>         ignore = expr;
>         return false;
> }
>
> static void match_assign(struct expression *expr)
> {
>         char *name;
>
>         if (!is_alloc(get_faked_expression()))
>                 return;
>         name = expr_to_str(expr->left);
>         if (name && strstr(name, "refcount.refs.counter"))
>                 set_state_expr(my_id, expr->left, &fresh);
>         free_string(name);
> }
>
> void check_kref_init_too_late(int id)
> {
>         my_id = id;
>
>         add_hook(&match_assign, ASSIGNMENT_HOOK_AFTER);
>         add_modification_hook(my_id, &match_modify);
> }
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20210727141455.GM1931%40kadam.
