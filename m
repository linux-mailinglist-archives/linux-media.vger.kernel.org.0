Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B4A7671C0
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 18:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjG1QUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 12:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjG1QUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 12:20:00 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9342D42
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 09:19:59 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-76c93abeb83so33427285a.0
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1690561199; x=1691165999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f5FSJWNjl98U9ps1qviIrSxLLSw9XgjSAMERAsNrO8o=;
        b=KEXrHXE3gUClBeMJtvBhVMzAyFvMFnNREdMBkD+3LXyQSu+9xqdjyGdL+kXW3v8wCv
         rBg60jzO1fLTjU8skLo059I3y/KDwourf0c8jYvW17+Pu2/tu7MSwjp+54+XhNiXJSyp
         I0OHDW6Rnns0LogQb9uGjdtjVgHV0vZ0MW/fPzx9QCj8W2aK37Simctem8zaFjVsNyLS
         SX1gIAzNbVoXeVdtO5+JTeRNq3j0UVmlnL74Oo2YeBlv6zQuQ00y1A60Wpq00YTCWgFg
         omF86mYj9w7XZMuIhgy6RW4RhnvnPIcf4zfyEO/Wpjr6cU/I3t9t3xMCWtlWL7j02o/K
         ahEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690561199; x=1691165999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5FSJWNjl98U9ps1qviIrSxLLSw9XgjSAMERAsNrO8o=;
        b=UV5lCqmzF0WYD5aGWq2QrdaCQgnKvFJv7TU8UlzLmr5nC2bNEB8ZjMCwpcqC7+MMo0
         PRDdoivKb/O2MB+WPhsO4HKMHieCXQ/EhYE41cUyLrHUknvNBl9JNVR+LMMmLXKtXsjz
         X4B1gQVlZWul3XGMST1coGT0JPBB6+tCzC9MjrRjpmDKHW8t78dLt463nxmvH+TzgqVK
         bV9ro7KXsPsd/rkeKMPuCChlilHNUnIMExUQuCXbx44O3iHa36l75Al2xJcGXf7Urvvv
         yrGNeEt7Mi3erL4CsTzVF21KlajEIEfDv0ejOccrO7vXc6YruLM/+h2gYrvTEQsSMIRV
         EIJw==
X-Gm-Message-State: ABy/qLY/xRPSt8HW957gXmAlUYHCYANeT8X5bfeeLXvQflON81HtaUpw
        ek6bHag7uTYDF0BhwFSy6y5i9g==
X-Google-Smtp-Source: APBJJlH7zyAaV18gkPgZ97/o1KJg4A+vwfhVKbZVCQQlngEXqjzP+rHHJ0ha2jQ+CB3N7D8voenUZQ==
X-Received: by 2002:a05:620a:2545:b0:767:3e13:6017 with SMTP id s5-20020a05620a254500b007673e136017mr3460606qko.30.1690561198853;
        Fri, 28 Jul 2023 09:19:58 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:10:2688::7a9])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a14a800b0076aeeb69cb1sm1246028qkj.4.2023.07.28.09.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 09:19:58 -0700 (PDT)
Message-ID: <70ed7b3197f34c9f3dce9c83c527884c89df5449.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, ayaka@soulik.info,
        hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org
Date:   Fri, 28 Jul 2023 12:19:57 -0400
In-Reply-To: <10ad26e6-b2d0-d0e6-40c8-2cc70613188b@synaptics.com>
References: <20230704040044.681850-1-randy.li@synaptics.com>
         <20230704040044.681850-3-randy.li@synaptics.com>
         <20230712093301.nkj2vok2x7esdhb3@chromium.org>
         <f8f766c0166c502e29b06cda71f6531e44a91a17.camel@ndufresne.ca>
         <CAAFQd5CO4TS6wMsnaL7ob4CXogj5KT52x85YUUN1ZwDkOxW0oQ@mail.gmail.com>
         <583e22718b80cc5e1ae631528c83c95e97de5cae.camel@ndufresne.ca>
         <CAAFQd5CAJ7GxiY5=bBAa+L=1WJth6QZ3+PG83=GX+eEx1S4uhg@mail.gmail.com>
         <7d340df3-e14c-24de-4fc2-b7dca619447c@synaptics.com>
         <CAAFQd5BKHQPNVpDvpQaFn-q721BJknJCUB72urc2=EKsAH=OCg@mail.gmail.com>
         <10ad26e6-b2d0-d0e6-40c8-2cc70613188b@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 28 juillet 2023 =C3=A0 15:37 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
> > I think this is one reason to migrate to the stateless decoder design.
> >=20
> I didn't know such plan here. I don't think the current stateless API=20
> could export the reconstruction buffers for encoder or post-processing=
=20
> buffer for decoder to us.

Someone suggested introduce auxiliary queues in our meeting in Lyon a while=
 ago,
but I bet everyone got too busy with finalizing APIs, fixing fluster tests =
etc.
The suggestion felt like it would be possible to add it after the fact. Thi=
s was
also being discussed in the context of supporting multi-scalers (standalone=
 our
inline with the codec, like VC8000D+). It could also cover for primary and
secondary buffers, along with encoder primary, and reconstruction buffers, =
but
also auxiliary reference data. This would also be needed to properly suppor=
t
Vulkan Video fwiw, and could also help with a transition to DMABuf Heaps an=
d
memory accounting.

I've also had corridor discussion around having multi-instance media constr=
oller
devices. It wasn't clear how to bind the media instance to the video node
instances, but assuming there is a way, it would be a tad more flexible (bu=
t
massively more complex).

Nicolas

