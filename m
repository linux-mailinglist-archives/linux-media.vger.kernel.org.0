Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9C1599D66
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 16:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349258AbiHSOQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 10:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349301AbiHSOQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 10:16:30 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B75EA061E
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 07:16:29 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3321c2a8d4cso124788747b3.5
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=/KBW+BzX2vV1CEJH0iXO7Z03r0qxUoUkGVUKMOGqEQo=;
        b=M2Gjp83YBe34ACXb/T0lSRHxCoEvH3+4U9ge3W8nUUaztKVooy9/j/HvSk+z3qOxoO
         SV7JLoDFrAc+RIE3ZbjjbzjemBA7d3iF4syamG5XLn2us/IRUh5MbxtCLMb9aIZMVF0J
         0ZRl7ZMhx+GGGxY1Q1QJsugrrQWNQdMNsZf6VI4gch/NJ66Jju1KfEId3IXwaTDe7BHw
         E0G6EA27Xd1z8kxZDtuglN8nN0HGDSpkl+3xdp9JsvceZ5FnmMdfXC2HrcVHZCTjVgaT
         /68WxH/IhFnx7UhAVjI6C5UQ5sDu7DMkvgQ2BmPWd6IKR7qL5xCILgFgfCJBmBp2dEDC
         i6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=/KBW+BzX2vV1CEJH0iXO7Z03r0qxUoUkGVUKMOGqEQo=;
        b=utsgcejlgqO511iCHaZWauxBzSSUvmX0715jJGbolMEaaOka3DhtOXHbJ4CsDdO3Et
         r7H0p5vnEGhMg7fqpmkb3RaLZpiIzmOjzWEA4Jb/FUUgvZMGoLTP0eDkdIb4MRsgAEcw
         Qk4FbjWbz5nvaPkOTOBPk5GWhRmf//9m8vs45OPMctd2APbIwFa/uPK7HHyXCrx5ddpv
         vOEc3hbrDXZGA/oE+91+TQXM/nyyvzb1zxY7/FjIybDB7H6F9/snwF2gmHKF3UbEb8k1
         b0cV+/PDJ2LK0EUE3tQtCWfdeQ5R0SWsDqlZ8pmKWRIW1c3nXQTU047X+/Nbz167Y+gc
         EG2A==
X-Gm-Message-State: ACgBeo0kagH6tx7IMJux2t8CcLRSI1KQALcJlObs3hZni+lIP3BKUZwx
        I0GnKBo9qc/3xqdzL73Jq/5KgzYwSaiD6b/SPZSuPJfltAQ=
X-Google-Smtp-Source: AA6agR5UIwVjXlurrYKjL0tRXvghMen7iOpYLjkVqxIECL8V9HLXfo7SqfUW8yfynBmyNAdIFEAJJJMpo4BP9ZlCHNQ=
X-Received: by 2002:a25:1857:0:b0:68f:104d:15eb with SMTP id
 84-20020a251857000000b0068f104d15ebmr7886262yby.5.1660918588280; Fri, 19 Aug
 2022 07:16:28 -0700 (PDT)
MIME-Version: 1.0
From:   linux guy <linuxguy123@gmail.com>
Date:   Fri, 19 Aug 2022 08:16:17 -0600
Message-ID: <CAJPRYe+h9s4_hrdTR6ezwCpZF5xMCAPrP8t828QeW6STT_ShxQ@mail.gmail.com>
Subject: Mobius camera demux error in v4l2 ?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

I'm having an issue using my Mobius camera in Linux.   A summary of
the issue can be found here:
https://bugzilla.redhat.com/show_bug.cgi?id=2107763

Is this the appropriate place to discuss this problem ?

Thanks
