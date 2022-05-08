Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D151EBE6
	for <lists+linux-media@lfdr.de>; Sun,  8 May 2022 07:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiEHFS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 May 2022 01:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiEHFS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 May 2022 01:18:57 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE626425
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 22:15:07 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnZG1-002AX1-RK; Sun, 08 May 2022 05:15:02 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnZFz-008EFp-E7; Sun, 08 May 2022 05:14:59 +0000
Date:   Sun, 8 May 2022 05:14:58 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <1010274796.0.1651986898906@builder.linuxtv.org>
In-Reply-To: <1843219824.0.1650927465869@builder.linuxtv.org>
References: <1843219824.0.1650927465869@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #450
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/450/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: gpio-ir-tx: simplify wait logic

[Mauro Carvalho Chehab] media: docs: media: uvcvideo: Use linux-media mailing list

[Mauro Carvalho Chehab] media: uvcvideo: Fix missing check to determine if element is found in list

[Mauro Carvalho Chehab] media: uvcvideo: Fix bit overflow in uvc_probe_video

[Mauro Carvalho Chehab] media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails

[Mauro Carvalho Chehab] media: uvcvideo: Simplify uvc_endpoint_max_bpi()

[Mauro Carvalho Chehab] media: uvcvideo: Undup use uvc_endpoint_max_bpi() code

[Mauro Carvalho Chehab] media: uvcvideo: Add UVC_GUID_FORMAT_H265


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/media_stage_clang/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/media_stage_clang/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/media_stage.git # timeout=10
Fetching upstream changes from git://linuxtv.org/media_stage.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
 > git fetch --tags --force --progress -- git://linuxtv.org/media_stage.git +refs/heads/*:refs/remotes/origin/* # timeout=30
Seen branch in repository origin/master
Seen 1 remote branch
 > git show-ref --tags -d # timeout=10
Checking out Revision be938c70e292731f81226917fc214683e66da577 (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f be938c70e292731f81226917fc214683e66da577 # timeout=10
Commit message: "media: uvcvideo: Add UVC_GUID_FORMAT_H265"
 > git rev-list --no-walk 6c1c1eb8c87de221051b9198d40971640060842f # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse be938c70e292731f81226917fc214683e66da577^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_stage.git'
[GitCheckoutListener] Found previous build 'media_stage_clang #449' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '6c1c1eb'
[GitCheckoutListener] -> Using head commit 'be938c7' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@29268fdd'
[GitCheckoutListener] -> Recorded 8 new commits
[media_stage_clang] $ /bin/sh -xe /tmp/jenkins4922168907188976153.sh
+ export CCACHE_DIR=/var/lib/jenkins/.ccache
+ export PATH=/usr/lib/ccache:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
+ make W=1 CC=clang-12 HOSTCC=clang-12 allyesconfig
#
# configuration written to .config
#
+ ./scripts/config -d MODULE_SIG -d KEYS -d IMA -d CONFIG_DEBUG_INFO -d SYSTEM_TRUSTED_KEYRING -d MODVERSIONS -d CHECK_SIGNATURE
+ make W=1 CC=clang-12 HOSTCC=clang-12 init
  SYNC    include/config/auto.conf.cmd
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      init/do_mounts.o
In file included from init/do_mounts.c:22:
In file included from ./include/linux/nfs_fs.h:31:
In file included from ./include/linux/sunrpc/auth.h:13:
In file included from ./include/linux/sunrpc/sched.h:19:
./include/linux/sunrpc/xdr.h:734:10: error: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (len > SIZE_MAX / sizeof(*p))
            ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
1 error generated.
make[1]: *** [scripts/Makefile.build:288: init/do_mounts.o] Error 1
make: *** [Makefile:1834: init] Error 2
Build step 'Execute shell' marked build as failure
Not sending mail to unregistered user daniel@iogearbox.net
Not sending mail to unregistered user herbert@gondor.apana.org.au
Not sending mail to unregistered user pmladek@suse.com
Not sending mail to unregistered user rafael.j.wysocki@intel.com
Not sending mail to unregistered user rmk+kernel@armlinux.org.uk
Not sending mail to unregistered user wsa@the-dreams.de
Not sending mail to unregistered user keescook@chromium.org
Not sending mail to unregistered user ast@kernel.org
Not sending mail to unregistered user snitzer@redhat.com
Not sending mail to unregistered user kuba@kernel.org
Not sending mail to unregistered user robh@kernel.org
Not sending mail to unregistered user martin.petersen@oracle.com
Not sending mail to unregistered user sre@kernel.org
Not sending mail to unregistered user mcgrof@kernel.org
Not sending mail to unregistered user axboe@kernel.dk
Not sending mail to unregistered user bcain@codeaurora.org
Not sending mail to unregistered user ebiederm@xmission.com
Not sending mail to unregistered user palmer@rivosinc.com
Not sending mail to unregistered user corbet@lwn.net
Not sending mail to unregistered user mpe@ellerman.id.au
Not sending mail to unregistered user marex@denx.de
Not sending mail to unregistered user daniel.thompson@linaro.org
Not sending mail to unregistered user bhelgaas@google.com
Not sending mail to unregistered user tglx@linutronix.de
Not sending mail to unregistered user torvalds@linux-foundation.org
Not sending mail to unregistered user alex.williamson@redhat.com
Not sending mail to unregistered user dsterba@suse.com
Not sending mail to unregistered user johannes.berg@intel.com
Not sending mail to unregistered user p.zabel@pengutronix.de
Not sending mail to unregistered user linkinjeon@kernel.org
Not sending mail to unregistered user anthony.l.nguyen@intel.com
Not sending mail to unregistered user ulf.hansson@linaro.org
Not sending mail to unregistered user djwong@kernel.org
Not sending mail to unregistered user alexandre.belloni@bootlin.com
Not sending mail to unregistered user jroedel@suse.de
Not sending mail to unregistered user joonas.lahtinen@linux.intel.com
Not sending mail to unregistered user skhan@linuxfoundation.org
Not sending mail to unregistered user linus.walleij@linaro.org
Not sending mail to unregistered user pbonzini@redhat.com
Not sending mail to unregistered user kherbst@redhat.com
Not sending mail to unregistered user sboyd@kernel.org
Not sending mail to unregistered user gor@linux.ibm.com
Not sending mail to unregistered user jgg@ziepe.ca
Not sending mail to unregistered user willy@infradead.org
Not sending mail to unregistered user brgl@bgdev.pl
Not sending mail to unregistered user mkl@pengutronix.de
Not sending mail to unregistered user bleung@chromium.org
Not sending mail to unregistered user maxime@cerno.tech
Not sending mail to unregistered user sudeep.holla@arm.com
Not sending mail to unregistered user peterz@infradead.org
Not sending mail to unregistered user agruenba@redhat.com
Not sending mail to unregistered user hca@linux.ibm.com
Not sending mail to unregistered user wei.liu@kernel.org
Not sending mail to unregistered user gregkh@linuxfoundation.org
Not sending mail to unregistered user masahiroy@kernel.org
Not sending mail to unregistered user airlied@redhat.com
Not sending mail to unregistered user robdclark@chromium.org
Not sending mail to unregistered user pablo@netfilter.org
Not sending mail to unregistered user mingo@kernel.org
Not sending mail to unregistered user kvalo@codeaurora.org
Not sending mail to unregistered user rostedt@goodmis.org
Not sending mail to unregistered user mst@redhat.com
Not sending mail to unregistered user dan.j.williams@intel.com
Not sending mail to unregistered user chuck.lever@oracle.com
Not sending mail to unregistered user andriy.shevchenko@linux.intel.com
Not sending mail to unregistered user boris.ostrovsky@oracle.com
Not sending mail to unregistered user arnd@arndb.de
Not sending mail to unregistered user broonie@kernel.org
Not sending mail to unregistered user wim@linux-watchdog.org
Not sending mail to unregistered user tzimmermann@suse.de
Not sending mail to unregistered user alexander.deucher@amd.com
Not sending mail to unregistered user davem@davemloft.net
Not sending mail to unregistered user dmitry.torokhov@gmail.com
Not sending mail to unregistered user lee.jones@linaro.org
Not sending mail to unregistered user maz@kernel.org
Not sending mail to unregistered user deller@gmx.de
Not sending mail to unregistered user fw@strlen.de
Not sending mail to unregistered user will@kernel.org
Not sending mail to unregistered user dhowells@redhat.com
Not sending mail to unregistered user trond.myklebust@hammerspace.com
Not sending mail to unregistered user jani.nikula@intel.com
Not sending mail to unregistered user anup@brainfault.org
Not sending mail to unregistered user damien.lemoal@wdc.com
Not sending mail to unregistered user bp@suse.de
Not sending mail to unregistered user Jason@zx2c4.com
Not sending mail to unregistered user tsbogend@alpha.franken.de
Not sending mail to unregistered user daniel.vetter@ffwll.ch
Not sending mail to unregistered user stfrench@microsoft.com
Not sending mail to unregistered user pabeni@redhat.com
Not sending mail to unregistered user acme@redhat.com
Not sending mail to unregistered user krzysztof.kozlowski@canonical.com
Not sending mail to unregistered user hch@lst.de
Not sending mail to unregistered user tiwai@suse.de
Not sending mail to unregistered user christian.koenig@amd.com
Not sending mail to unregistered user hdegoede@redhat.com
