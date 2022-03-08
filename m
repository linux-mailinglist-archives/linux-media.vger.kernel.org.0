Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065F94D246E
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 23:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350784AbiCHWlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 17:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243505AbiCHWli (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 17:41:38 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E85C5938A
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 14:40:41 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id u29so454848qtc.6
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TnWLXlR8aYDqnVLzpMvTN+TVaLUvD22OYnwwIYdN8iU=;
        b=K61mwD3iHQmtJmuKxhVVJfyhJuBqcktgKdnRPtAun1aGUn8s+zMepzKP1xE2PZr5M0
         eqEnzQJfimzOCuK1lDX0mQNRD3N/SvMoCzeuvukqXlmZztE7f0rcd6CbCNccfeZg0fgP
         Yk3yg8HqKYWXd4MMdjl8CAYEfVg251NkcXjr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TnWLXlR8aYDqnVLzpMvTN+TVaLUvD22OYnwwIYdN8iU=;
        b=bsO84geAWqwTad6qy7vYRtByQeSz86rkz4mll1a9fqTAWGTEnbx2MaYyTo9SLEbEDw
         hhXjFejZKK5s3SgAJkEwBVoTQNeKY2NKZtTksy8H7n8ELiwA+V39vuVdw0BQJAzJaZfM
         xQ9aPW4PQ3ItJupscyT/HysAVFyVgJ4m98ups12Or/hIun8zUm15fisL7/QyFeE9eWOp
         XPp7KWFU00Np8oFqn8XpIiXc9536lJtpB0zVN75TBFuD9/PfEYX5cDyC3nlQLE2fDXfJ
         u+a9RaYlGhz9TjEAavceJ/db4LkHrBR/MxrMYY+CVZTYueDUbofc38+uG8Jy5aDtIQcb
         nO2g==
X-Gm-Message-State: AOAM533yn/eKg2KmCuFkxzqw0pDc8O+pS6aCeAQMo82+yLhlovt/QVi6
        atMBtqSc0XOlH3+igSt0VuLvCqcvqTPlSw==
X-Google-Smtp-Source: ABdhPJzQHBx4TEaFwKLnhJ6H2SH/jhrPUf+TclzDZ/pz7WuV2Ti7Je0h7a4+sXL6ZUXh4CI0o3f4Wg==
X-Received: by 2002:a05:622a:110:b0:2dd:461a:6126 with SMTP id u16-20020a05622a011000b002dd461a6126mr15699256qtw.379.1646779240335;
        Tue, 08 Mar 2022 14:40:40 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id s31-20020a05622a1a9f00b002e0dfa297b9sm168750qtc.80.2022.03.08.14.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 14:40:39 -0800 (PST)
Date:   Tue, 8 Mar 2022 17:40:37 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jack <ostroffjh@users.sourceforge.net>
Cc:     linux-media@vger.kernel.org
Subject: Fix linux-uvc-devel list in documentation
Message-ID: <20220308224037.6ku5m5hefqdt6dio@meerkat.local>
References: <TXE6H3FD.WNHGERVX.ZHXAYFZT@4W6ESB4E.Z5CPPA2J.NFOEI2WH>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TXE6H3FD.WNHGERVX.ZHXAYFZT@4W6ESB4E.Z5CPPA2J.NFOEI2WH>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello:

This should probably go to the linux-media list. Forwarding as such.

-K

On Tue, Mar 08, 2022 at 11:25:49AM -0500, Jack wrote:
> I'm forwarding from the linux-uvc-devel mailing list, as the OP doesn't seem
> to know where to send the request.  The doc still shows an old address for
> the list (linux-uvc-devel@lists.berlios.de)
> 
> If you're not the one to update the page, please forward as appropriate, or
> let  me know who to contact.
> 
> Thanks
> 
> Jack Ostroff
> 
> ------------------------------
> 
> On 2022.03.08 06:05, Massimo B. wrote:
> Please update
> https://www.kernel.org/doc/html/v5.17-rc7/userspace-api/media/drivers/uvcvideo.html
> for the new mail-adress:
> linux-uvc-devel@lists.sourceforge.net
