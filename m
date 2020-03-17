Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEEF18783F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 04:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgCQDri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 23:47:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:24872 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgCQDrh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 23:47:37 -0400
IronPort-SDR: gx+qNMUHhwo78tg2YJ9d52r7bujHJ+Ivu1JdwcFxpcWrMPLcXWDLGouH3/9b2YFe9K5KdZLGz0
 onERo2HbNmOg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 20:47:27 -0700
IronPort-SDR: QKnRM9QK/Nvd567xhKfMyPUOa+2WdBUVkVJK7kO4Njmez4mFi9AQe1Mkct6dGrrHHacwPRFJt4
 Gv1zvPdlRO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,562,1574150400"; 
   d="gz'50?scan'50,208,50";a="390929441"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Mar 2020 20:47:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jE3CP-000INv-1d; Tue, 17 Mar 2020 11:47:25 +0800
Date:   Tue, 17 Mar 2020 11:47:17 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l2-common: add helper functions to call
 s_stream() callbacks
Message-ID: <202003171127.Q6K7EUP0%lkp@intel.com>
References: <20200316193305.428378-3-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <20200316193305.428378-3-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Helen,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on v5.6-rc6 next-20200316]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Helen-Koike/media-add-v4l2_pipeline_stream_-enable-disable-helpers/20200317-080751
base:   git://linuxtv.org/media_tree.git master
config: s390-randconfig-a001-20200316 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.2.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
      69 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/compiler_types.h:129:35: error: 'struct v4l2_subdev' has no member named 'entity'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:990:21: note: in expansion of macro 'offsetof'
     990 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/v4l2-core/v4l2-common.c:37:
   drivers/media/v4l2-core/v4l2-common.c: At top level:
>> include/linux/compiler.h:56:23: error: expected identifier or '(' before 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
>> drivers/media/v4l2-core/v4l2-common.c:485:2: note: in expansion of macro 'if'
     485 |  if (!pipe->streaming_count)
         |  ^~
>> include/linux/compiler.h:72:2: error: expected identifier or '(' before ')' token
      72 | })
         |  ^
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_value'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-common.c:485:2: note: in expansion of macro 'if'
     485 |  if (!pipe->streaming_count)
         |  ^~
   drivers/media/v4l2-core/v4l2-common.c:488:15: error: expected declaration specifiers or '...' before '&' token
     488 |  mutex_unlock(&mdev->graph_mutex);
         |               ^
   drivers/media/v4l2-core/v4l2-common.c:490:2: error: expected identifier or '(' before 'return'
     490 |  return ret;
         |  ^~~~~~
   drivers/media/v4l2-core/v4l2-common.c:491:1: error: expected identifier or '(' before '}' token
     491 | }
         | ^
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/v4l2-core/v4l2-common.c:37:
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_enable':
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
      69 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/compiler_types.h:129:35: error: 'struct v4l2_subdev' has no member named 'entity'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:990:21: note: in expansion of macro 'offsetof'
     990 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/v4l2-core/v4l2-common.c:37:
   drivers/media/v4l2-core/v4l2-common.c: At top level:
>> include/linux/compiler.h:56:23: error: expected identifier or '(' before 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/media/v4l2-core/v4l2-common.c:535:2: note: in expansion of macro 'if'
     535 |  if (!pipe->streaming_count)
         |  ^~
>> include/linux/compiler.h:72:2: error: expected identifier or '(' before ')' token
      72 | })
         |  ^
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_value'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:535:2: note: in expansion of macro 'if'
     535 |  if (!pipe->streaming_count)
         |  ^~
   drivers/media/v4l2-core/v4l2-common.c:538:15: error: expected declaration specifiers or '...' before '&' token
     538 |  mutex_unlock(&mdev->graph_mutex);
         |               ^
   drivers/media/v4l2-core/v4l2-common.c:540:2: error: expected identifier or '(' before 'return'
     540 |  return ret;
         |  ^~~~~~
   drivers/media/v4l2-core/v4l2-common.c:541:1: error: expected identifier or '(' before '}' token
     541 | }
         | ^
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_disable':
   drivers/media/v4l2-core/v4l2-common.c:483:2: warning: control reaches end of non-void function [-Wreturn-type]
     483 |  }
         |  ^
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_enable':
   drivers/media/v4l2-core/v4l2-common.c:533:2: warning: control reaches end of non-void function [-Wreturn-type]
     533 |  }
         |  ^
--
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
      69 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/compiler_types.h:129:35: error: 'struct v4l2_subdev' has no member named 'entity'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:990:21: note: in expansion of macro 'offsetof'
     990 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:469:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     469 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media//v4l2-core/v4l2-common.c:37:
   drivers/media//v4l2-core/v4l2-common.c: At top level:
>> include/linux/compiler.h:56:23: error: expected identifier or '(' before 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/media//v4l2-core/v4l2-common.c:485:2: note: in expansion of macro 'if'
     485 |  if (!pipe->streaming_count)
         |  ^~
>> include/linux/compiler.h:72:2: error: expected identifier or '(' before ')' token
      72 | })
         |  ^
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_value'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:485:2: note: in expansion of macro 'if'
     485 |  if (!pipe->streaming_count)
         |  ^~
   drivers/media//v4l2-core/v4l2-common.c:488:15: error: expected declaration specifiers or '...' before '&' token
     488 |  mutex_unlock(&mdev->graph_mutex);
         |               ^
   drivers/media//v4l2-core/v4l2-common.c:490:2: error: expected identifier or '(' before 'return'
     490 |  return ret;
         |  ^~~~~~
   drivers/media//v4l2-core/v4l2-common.c:491:1: error: expected identifier or '(' before '}' token
     491 | }
         | ^
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media//v4l2-core/v4l2-common.c:37:
   drivers/media//v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_enable':
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
      69 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler.h:330:3: note: in expansion of macro 'if'
     330 |   if (!(condition))     \
         |   ^~
   include/linux/compiler.h:338:2: note: in expansion of macro '__compiletime_assert'
     338 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/compiler_types.h:129:35: error: 'struct v4l2_subdev' has no member named 'entity'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:990:21: note: in expansion of macro 'offsetof'
     990 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:518:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     518 |   sd = media_entity_to_v4l2_subdev(entity);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media//v4l2-core/v4l2-common.c:37:
   drivers/media//v4l2-core/v4l2-common.c: At top level:
>> include/linux/compiler.h:56:23: error: expected identifier or '(' before 'if'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/media//v4l2-core/v4l2-common.c:535:2: note: in expansion of macro 'if'
     535 |  if (!pipe->streaming_count)
         |  ^~
>> include/linux/compiler.h:72:2: error: expected identifier or '(' before ')' token
      72 | })
         |  ^
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_value'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/media//v4l2-core/v4l2-common.c:535:2: note: in expansion of macro 'if'
     535 |  if (!pipe->streaming_count)
         |  ^~
   drivers/media//v4l2-core/v4l2-common.c:538:15: error: expected declaration specifiers or '...' before '&' token
     538 |  mutex_unlock(&mdev->graph_mutex);
         |               ^
   drivers/media//v4l2-core/v4l2-common.c:540:2: error: expected identifier or '(' before 'return'
     540 |  return ret;
         |  ^~~~~~
   drivers/media//v4l2-core/v4l2-common.c:541:1: error: expected identifier or '(' before '}' token
     541 | }
         | ^
   drivers/media//v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_disable':
   drivers/media//v4l2-core/v4l2-common.c:483:2: warning: control reaches end of non-void function [-Wreturn-type]
     483 |  }
         |  ^
   drivers/media//v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_enable':
   drivers/media//v4l2-core/v4l2-common.c:533:2: warning: control reaches end of non-void function [-Wreturn-type]
     533 |  }
         |  ^

vim +/if +485 drivers/media/v4l2-core/v4l2-common.c

   444	
   445	int v4l2_pipeline_stream_disable(struct media_entity *entity,
   446					 struct media_pipeline *pipe)
   447	{
   448		struct media_device *mdev = entity->graph_obj.mdev;
   449		int ret = 0;
   450	
   451		mutex_lock(&mdev->graph_mutex);
   452	
   453		if (!pipe->streaming_count) {
   454			ret = media_graph_walk_init(&pipe->graph, mdev);
   455			if (ret) {
   456				mutex_unlock(&mdev->graph_mutex);
   457				return ret;
   458			}
   459		}
   460	
   461		media_graph_walk_start(&pipe->graph, entity);
   462	
   463		while ((entity = media_graph_walk_next_stream(&pipe->graph))) {
   464			struct v4l2_subdev *sd;
   465	
   466			if (!is_media_entity_v4l2_subdev(entity))
   467				continue;
   468	
   469			sd = media_entity_to_v4l2_subdev(entity);
   470			if (!sd->stream_count || --sd->stream_count)
   471				continue;
   472	
   473			ret = v4l2_subdev_call(sd, video, s_stream, false);
   474			if (ret && ret != -ENOIOCTLCMD)
   475				dev_dbg(mdev->dev,
   476					"couldn't disable stream for subdevice '%s'\n",
   477					entity->name);
   478				break;
   479			}
   480	
   481			dev_dbg(mdev->dev,
   482				"stream disabled for subdevice '%s'\n", entity->name);
   483		}
   484	
 > 485		if (!pipe->streaming_count)
   486			media_graph_walk_cleanup(&pipe->graph);
   487	
   488		mutex_unlock(&mdev->graph_mutex);
   489	
   490		return ret;
   491	}
   492	EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
   493	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--envbJBWh7q8WU6mo
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ExspLxb/D4Nvic/2twEA

--envbJBWh7q8WU6mo--
