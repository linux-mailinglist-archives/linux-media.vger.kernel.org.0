Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68D462E979
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 00:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240005AbiKQXUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 18:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbiKQXU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 18:20:28 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCA872985
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 15:20:19 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id x18so2374767qki.4
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
        b=McHst7l/f7KmgETncU4ax8Cz1+X0pDSSDz+NpOo85KKRbSTGF3eq2IAlrIRy/FELSJ
         Y7C0SIlyu5mGQyhzPLIjsCXMOXUrzD5TZH+dJcbaF2LHrVuVcof8hyWOL3D9pZZx4wAD
         8LINQRolzJh6QXumNwKV51jsDIdF9sMEo4+5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
        b=j2Ea+Br0oiBWOZIvnGMcHDDRi1g+6Node0JqW6qbHsgG0xV4V/bLR5Y5dslGwoHev9
         DSIQeNxpzuuazf9cedMsOudPmRFz795+Gq8loF22/7BRqlmBiEbp/m5NtUynHBhQ4jZj
         8yFQt4Vsqps2ADu7k/ZRDQwdcq3pYUEn9RukucMcrvFYdMBvUv+3C63bcBW8cy+6zza3
         M+VKHiDrERe86dVdNr1NDw/TsKpRFAZhnTECEc3gaJ7xWB3XzJkeuJyxncvsRQpk6HPl
         EI5LSVVdZA6QUCaQBJV0KNsfdnotcH4Ya3/65E9FEzKIaQoRZ51ZfMrngtY22WmmQxX9
         qpcA==
X-Gm-Message-State: ANoB5pmh5lkXxbIFmsjTQv14KIZBJTiKV/oI+NKcykb+hcZhm74momVm
        4f3pGvBX0ERQcRIhTJTeXsymxSzdJ90UOA==
X-Google-Smtp-Source: AA0mqf5HTctofjSZMCiWYEKTw5lTxrRkImWNpoTgX/yYW+dXTgv8q/47w9ttW5OeveXFWwxfqw0TJQ==
X-Received: by 2002:a05:620a:468f:b0:6f4:fe28:a69f with SMTP id bq15-20020a05620a468f00b006f4fe28a69fmr3813060qkb.21.1668727218482;
        Thu, 17 Nov 2022 15:20:18 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id r3-20020ac84243000000b0039ccbf75f92sm1098807qtm.11.2022.11.17.15.20.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 15:20:17 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id p8so1637117qvn.5
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 15:20:17 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr4665856qvp.129.1668727216978; Thu, 17
 Nov 2022 15:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com> <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com> <202211171439.CDE720EAD@keescook>
In-Reply-To: <202211171439.CDE720EAD@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Nov 2022 15:20:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
To:     Kees Cook <keescook@chromium.org>
Cc:     David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Shuah Khan <shuah@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Biederman <ebiederm@xmission.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 17, 2022 at 2:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
> new stack contents to the nascent brpm->vma, which was newly allocated
> with VM_STACK_FLAGS, which an arch can override, but they all appear to include
> VM_WRITE | VM_MAYWRITE.

Yeah, it does seem entirely superfluous.

It's been there since the very beginning (although in that original
commit b6a2fea39318 it was there as a '1' to the 'force' argument to
get_user_pages()).

I *think* it can be just removed. But as long as it exists, it should
most definitely not be renamed to FOLL_PTRACE.

There's a slight worry that it currently hides some other setup issue
that makes it matter, since it's been that way so long, but I can't
see what it is.

             Linus
