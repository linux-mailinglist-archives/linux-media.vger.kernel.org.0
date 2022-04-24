Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5691C50D045
	for <lists+linux-media@lfdr.de>; Sun, 24 Apr 2022 09:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238525AbiDXHpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Apr 2022 03:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiDXHpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Apr 2022 03:45:53 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28B21EC58
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 00:42:52 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1niWtJ-00Fa6M-TP; Sun, 24 Apr 2022 07:42:46 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1niWtI-008YNs-87; Sun, 24 Apr 2022 07:42:43 +0000
Date:   Sun, 24 Apr 2022 07:42:43 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <416118082.1.1650786163695@builder.linuxtv.org>
In-Reply-To: <1578693806.0.1650782704999@builder.linuxtv.org>
References: <1578693806.0.1650782704999@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_clang #446
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_clang
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_clang/446/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: imx: imx-mipi-csis: Add support for JPEG_1X8

[Mauro Carvalho Chehab] media: entity: skip non-data link when removing reverse links

[Mauro Carvalho Chehab] media: entity: Skip non-data links in graph iteration

[Mauro Carvalho Chehab] media: media.h: Add new media link type

[Mauro Carvalho Chehab] media: entity: Add link_type_name() helper

[Mauro Carvalho Chehab] media: entity: Add support for ancillary links

[Mauro Carvalho Chehab] media: v4l2-async: Create links during v4l2_async_match_notify()

[Mauro Carvalho Chehab] media: ccs: Use %u for printing unsigned values, remove extra debug print

[Mauro Carvalho Chehab] media: ccs: Use unsigned int as index to an array

[Mauro Carvalho Chehab] media: mc: Remove redundant documentation

[Mauro Carvalho Chehab] media: mc: media_device_init() initialises a media_device, not media_entity

[Mauro Carvalho Chehab] media: mc: Provide a helper for setting bus_info field

[Mauro Carvalho Chehab] media: mc: Set bus_info in media_device_init()

[Mauro Carvalho Chehab] media: v4l: ioctl: Set bus_info in v4l_querycap()

[Mauro Carvalho Chehab] media: i2c: max9286: fix kernel oops when removing module

[Mauro Carvalho Chehab] media: staging: media: ipu3: Fix AF x_start position when rightmost stripe is used

[Mauro Carvalho Chehab] media: staging: media: ipu3-imgu: Request specific firmware binary

[Mauro Carvalho Chehab] media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()

[Mauro Carvalho Chehab] media: staging/intel-ipu3: Reset imgu_video_device sequence

[Mauro Carvalho Chehab] media: staging/intel-ipu3: Cleanup dummy buffers via helper

[Mauro Carvalho Chehab] media: mc: delete redundant code in __media_device_unregister_entity

[Mauro Carvalho Chehab] media: i2c: ov5645: Fix media bus format

[Mauro Carvalho Chehab] media: v4l2-subdev: fix #endif comments

[Mauro Carvalho Chehab] media: v4l2-subdev: drop extra #ifdef

[Mauro Carvalho Chehab] media: subdev: rename subdev-state alloc & free

[Mauro Carvalho Chehab] media: subdev: add active state to struct v4l2_subdev

[Mauro Carvalho Chehab] media: subdev: rename v4l2_subdev_get_pad_* helpers

[Mauro Carvalho Chehab] media: subdev: pass also the active state to subdevs from ioctls

[Mauro Carvalho Chehab] media: subdev: add subdev state locking

[Mauro Carvalho Chehab] media: subdev: add locking wrappers to subdev op wrappers

[Mauro Carvalho Chehab] media: subdev: add v4l2_subdev_get_fmt() helper function

[Mauro Carvalho Chehab] media: Documentation: add documentation about subdev state

[Mauro Carvalho Chehab] media: Revert "media: dw9768: activate runtime PM and turn off device"

[Mauro Carvalho Chehab] media: ov7640: Use ARRAY_SIZE instead of manual checking

[Mauro Carvalho Chehab] media: i2c: ov5695: fix typos in comments

[Mauro Carvalho Chehab] media: i2c: cleanup comments

[Mauro Carvalho Chehab] media: i2c: dw9714: Disable the regulator when the driver fails to probe

[Mauro Carvalho Chehab] media: i2c: dw9714: Return zero in remove callback

[Mauro Carvalho Chehab] media: media.h: remove unneeded <stdint.h> inclusion

[Mauro Carvalho Chehab] media: media-entity.h: Fix documentation for media_create_intf_link

[Mauro Carvalho Chehab] media: staging: media: ipu3: Fix AWB x_start position when rightmost stripe is used

[Mauro Carvalho Chehab] media: video-mux: Use dev_err_probe()

[Mauro Carvalho Chehab] media: venus: hfi: Add error message for timeout error

[Mauro Carvalho Chehab] media: venus: hfi: avoid null dereference in deinit

[Mauro Carvalho Chehab] media: venus: do not queue internal buffers from previous sequence

[Mauro Carvalho Chehab] media: venus: vdec: ensure venus is powered on during stream off

[Mauro Carvalho Chehab] media: v4l: Add Qualcomm custom compressed pixel formats

[Mauro Carvalho Chehab] media: venus: helpers: Add helper to check supported pixel formats

[Mauro Carvalho Chehab] media: venus: Add a handling of QC08C compressed format

[Mauro Carvalho Chehab] media: venus: hfi_platform: Correct supported compressed format

[Mauro Carvalho Chehab] media: venus: Add a handling of QC10C compressed format

[Mauro Carvalho Chehab] media: venus: vdec: Use output resolution on reconfigure

[Mauro Carvalho Chehab] media: v4l2-ctrls: Add intra-refresh type control

[Mauro Carvalho Chehab] media: venus: venc: Add support for intra-refresh type


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
Checking out Revision fc503c8a3f12af7093da60f790e6830f8ca5b23d (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f fc503c8a3f12af7093da60f790e6830f8ca5b23d # timeout=10
Commit message: "media: venus: venc: Add support for intra-refresh type"
 > git rev-list --no-walk f1b57164305d6342b9f77a4f4482cde492b56983 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse fc503c8a3f12af7093da60f790e6830f8ca5b23d^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/media_stage.git'
[GitCheckoutListener] Found previous build 'media_stage_clang #445' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'f1b5716'
[GitCheckoutListener] -> Using head commit 'fc503c8' as starting point
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@426e254e'
[GitCheckoutListener] -> Recorded 54 new commits
[media_stage_clang] $ /bin/sh -xe /tmp/jenkins5911436276443700768.sh
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
  HDRINST usr/include/linux/videodev2.h
  HDRINST usr/include/linux/media.h
  HDRINST usr/include/linux/v4l2-controls.h
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
Not sending mail to unregistered user anup@brainfault.org
Not sending mail to unregistered user djwong@kernel.org
Not sending mail to unregistered user joonas.lahtinen@linux.intel.com
Not sending mail to unregistered user stfrench@microsoft.com
Not sending mail to unregistered user rmk+kernel@armlinux.org.uk
Not sending mail to unregistered user wsa@the-dreams.de
Not sending mail to unregistered user corbet@lwn.net
Not sending mail to unregistered user damien.lemoal@wdc.com
Not sending mail to unregistered user axboe@kernel.dk
Not sending mail to unregistered user gor@linux.ibm.com
Not sending mail to unregistered user pabeni@redhat.com
Not sending mail to unregistered user boris.ostrovsky@oracle.com
Not sending mail to unregistered user christian.koenig@amd.com
Not sending mail to unregistered user deller@gmx.de
Not sending mail to unregistered user palmer@rivosinc.com
Not sending mail to unregistered user andriy.shevchenko@linux.intel.com
Not sending mail to unregistered user ulf.hansson@linaro.org
Not sending mail to unregistered user robh@kernel.org
Not sending mail to unregistered user fw@strlen.de
Not sending mail to unregistered user tiwai@suse.de
Not sending mail to unregistered user snitzer@redhat.com
Not sending mail to unregistered user rafael.j.wysocki@intel.com
Not sending mail to unregistered user will@kernel.org
Not sending mail to unregistered user pmladek@suse.com
Not sending mail to unregistered user alexander.deucher@amd.com
Not sending mail to unregistered user kvalo@codeaurora.org
Not sending mail to unregistered user peterz@infradead.org
Not sending mail to unregistered user kherbst@redhat.com
Not sending mail to unregistered user brgl@bgdev.pl
Not sending mail to unregistered user davem@davemloft.net
Not sending mail to unregistered user wei.liu@kernel.org
Not sending mail to unregistered user mst@redhat.com
Not sending mail to unregistered user tglx@linutronix.de
Not sending mail to unregistered user chuck.lever@oracle.com
Not sending mail to unregistered user dmitry.torokhov@gmail.com
Not sending mail to unregistered user dsterba@suse.com
Not sending mail to unregistered user mcgrof@kernel.org
Not sending mail to unregistered user dhowells@redhat.com
Not sending mail to unregistered user pablo@netfilter.org
Not sending mail to unregistered user rostedt@goodmis.org
Not sending mail to unregistered user sre@kernel.org
Not sending mail to unregistered user hch@lst.de
Not sending mail to unregistered user jgg@ziepe.ca
Not sending mail to unregistered user jani.nikula@intel.com
Not sending mail to unregistered user bhelgaas@google.com
Not sending mail to unregistered user sboyd@kernel.org
Not sending mail to unregistered user masahiroy@kernel.org
Not sending mail to unregistered user tsbogend@alpha.franken.de
Not sending mail to unregistered user skhan@linuxfoundation.org
Not sending mail to unregistered user mingo@kernel.org
Not sending mail to unregistered user mkl@pengutronix.de
Not sending mail to unregistered user wim@linux-watchdog.org
Not sending mail to unregistered user broonie@kernel.org
Not sending mail to unregistered user maxime@cerno.tech
Not sending mail to unregistered user robdclark@chromium.org
Not sending mail to unregistered user daniel@iogearbox.net
Not sending mail to unregistered user linus.walleij@linaro.org
Not sending mail to unregistered user mpe@ellerman.id.au
Not sending mail to unregistered user linkinjeon@kernel.org
Not sending mail to unregistered user bleung@chromium.org
Not sending mail to unregistered user pbonzini@redhat.com
Not sending mail to unregistered user daniel.thompson@linaro.org
Not sending mail to unregistered user daniel.vetter@ffwll.ch
Not sending mail to unregistered user maz@kernel.org
Not sending mail to unregistered user tzimmermann@suse.de
Not sending mail to unregistered user marex@denx.de
Not sending mail to unregistered user acme@redhat.com
Not sending mail to unregistered user gregkh@linuxfoundation.org
Not sending mail to unregistered user trond.myklebust@hammerspace.com
Not sending mail to unregistered user Jason@zx2c4.com
Not sending mail to unregistered user krzysztof.kozlowski@canonical.com
Not sending mail to unregistered user hca@linux.ibm.com
Not sending mail to unregistered user martin.petersen@oracle.com
Not sending mail to unregistered user alex.williamson@redhat.com
Not sending mail to unregistered user p.zabel@pengutronix.de
Not sending mail to unregistered user kuba@kernel.org
Not sending mail to unregistered user bp@suse.de
Not sending mail to unregistered user dan.j.williams@intel.com
Not sending mail to unregistered user arnd@arndb.de
Not sending mail to unregistered user bcain@codeaurora.org
Not sending mail to unregistered user keescook@chromium.org
Not sending mail to unregistered user jroedel@suse.de
Not sending mail to unregistered user alexandre.belloni@bootlin.com
Not sending mail to unregistered user agruenba@redhat.com
Not sending mail to unregistered user sudeep.holla@arm.com
Not sending mail to unregistered user lee.jones@linaro.org
Not sending mail to unregistered user hdegoede@redhat.com
Not sending mail to unregistered user ast@kernel.org
Not sending mail to unregistered user airlied@redhat.com
Not sending mail to unregistered user torvalds@linux-foundation.org
Not sending mail to unregistered user johannes.berg@intel.com
Not sending mail to unregistered user ebiederm@xmission.com
Not sending mail to unregistered user herbert@gondor.apana.org.au
Not sending mail to unregistered user willy@infradead.org
Not sending mail to unregistered user anthony.l.nguyen@intel.com
