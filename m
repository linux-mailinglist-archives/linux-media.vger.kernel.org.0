Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD95119E7FD
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 01:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgDDXC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 19:02:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:13761 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgDDXC0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Apr 2020 19:02:26 -0400
IronPort-SDR: pRAXHR0oaOOFIPdhXFuM3Y8AHOJ5zfWBwbx8qE9NHPzlrQJjqQfb8IP24ZpG78kX8Z9aplMT2L
 KqZV4gTk+i8g==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2020 16:02:23 -0700
IronPort-SDR: nVwJIECLipWWHk0CmuJlk6+e1s0hQmdPTN1ygxVi5FjvGk+pK8YYH0gQm3E+mzbg+j8ru2ATt/
 cZQq+mpkVYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,345,1580803200"; 
   d="gz'50?scan'50,208,50";a="360860199"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2020 16:02:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jKrnv-000FL9-Gk; Sun, 05 Apr 2020 07:02:19 +0800
Date:   Sun, 5 Apr 2020 07:01:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add helper functions to call
 s_stream() callbacks
Message-ID: <202004050609.4GY8rmPe%lkp@intel.com>
References: <20200403213312.1863876-2-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20200403213312.1863876-2-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Helen,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on v5.6 next-20200404]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Helen-Koike/media-add-v4l2_pipeline_stream_-enable-disable-helpers/20200405-050004
base:   git://linuxtv.org/media_tree.git master
config: s390-randconfig-a001-20200405 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_subdevs_get':
>> drivers/media/v4l2-core/v4l2-common.c:463:37: error: 'struct video_device' has no member named 'entity'
     463 |  struct media_entity *entity = &vdev->entity;
         |                                     ^~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/v4l2-core/v4l2-common.c:37:
>> include/linux/kernel.h:987:51: error: 'struct v4l2_subdev' has no member named 'entity'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
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
>> include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-common.c:491:20: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     491 |   subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler_types.h:129:35: error: 'struct v4l2_subdev' has no member named 'entity'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:990:21: note: in expansion of macro 'offsetof'
     990 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
>> include/media/v4l2-subdev.h:888:3: note: in expansion of macro 'container_of'
     888 |   container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |   ^~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-common.c:491:20: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     491 |   subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_enable':
   drivers/media/v4l2-core/v4l2-common.c:499:34: error: 'struct video_device' has no member named 'entity'
     499 |  struct media_device *mdev = vdev->entity.graph_obj.mdev;
         |                                  ^~
   In file included from include/linux/device.h:15,
                    from include/media/v4l2-dev.h:15,
                    from include/media/v4l2-common.h:18,
                    from drivers/media/v4l2-core/v4l2-common.c:47:
>> drivers/media/v4l2-core/v4l2-common.c:514:36: error: 'struct v4l2_subdev' has no member named 'entity'
     514 |    "enabling stream for '%s'\n", sd->entity.name);
         |                                    ^~
   include/linux/dev_printk.h:122:47: note: in definition of macro 'dev_dbg'
     122 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:529:37: error: 'struct v4l2_subdev' has no member named 'entity'
     529 |    "disabling stream for '%s'\n", sd->entity.name);
         |                                     ^~
   include/linux/dev_printk.h:122:47: note: in definition of macro 'dev_dbg'
     122 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_pipeline_stream_disable':
   drivers/media/v4l2-core/v4l2-common.c:540:34: error: 'struct video_device' has no member named 'entity'
     540 |  struct media_device *mdev = vdev->entity.graph_obj.mdev;
         |                                  ^~
   In file included from include/linux/device.h:15,
                    from include/media/v4l2-dev.h:15,
                    from include/media/v4l2-common.h:18,
                    from drivers/media/v4l2-core/v4l2-common.c:47:
   drivers/media/v4l2-core/v4l2-common.c:554:37: error: 'struct v4l2_subdev' has no member named 'entity'
     554 |    "disabling stream for '%s'\n", sd->entity.name);
         |                                     ^~
   include/linux/dev_printk.h:122:47: note: in definition of macro 'dev_dbg'
     122 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                               ^~~~~~~~~~~

vim +463 drivers/media/v4l2-core/v4l2-common.c

   444	
   445	/*
   446	 * v4l2_pipeline_subdevs_get - Assemble a list of subdevices in a pipeline
   447	 * @subdevs: the array to be filled
   448	 * @size: the array size
   449	 *
   450	 * Walk from a video node, following link from sink to source and fill the
   451	 * array with subdevices in the path.
   452	 *
   453	 * Note: this function follows the first enabled link in a sink pad found in a
   454	 * given entity. Thus it won't work if there are entities with multiple enabled
   455	 * links to its sink pads in the topology.
   456	 *
   457	 * Return the number of subdevices filled in the array.
   458	 */
   459	static unsigned int v4l2_pipeline_subdevs_get(struct video_device *vdev,
   460						      struct v4l2_subdev **subdevs,
   461						      unsigned int size)
   462	{
 > 463		struct media_entity *entity = &vdev->entity;
   464		unsigned int idx = 0;
   465	
   466		while (1) {
   467			struct media_pad *src_pad = NULL;
   468			unsigned int i;
   469	
   470			/* Find remote source pad */
   471			for (i = 0; i < entity->num_pads; i++) {
   472				struct media_pad *sink_pad = &entity->pads[i];
   473	
   474				if (!(sink_pad->flags & MEDIA_PAD_FL_SINK))
   475					continue;
   476	
   477				src_pad = media_entity_remote_pad(sink_pad);
   478				if (src_pad &&
   479				    is_media_entity_v4l2_subdev(src_pad->entity))
   480					break;
   481			}
   482			if (i == entity->num_pads)
   483				break;
   484	
   485			if (idx >= size) {
   486				WARN_ON(1);
   487				return 0;
   488			}
   489	
   490			entity = src_pad->entity;
 > 491			subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
   492		}
   493	
   494		return idx;
   495	}
   496	
   497	__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev)
   498	{
 > 499		struct media_device *mdev = vdev->entity.graph_obj.mdev;
   500		struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
   501		struct v4l2_subdev *sd;
   502		unsigned int i, size;
   503		int ret;
   504	
   505		mutex_lock(&mdev->graph_mutex);
   506	
   507		size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
   508	
   509		for (i = 0; i < size; i++) {
   510			sd = subdevs[i];
   511			if (sd->stream_count++)
   512				continue;
   513			dev_dbg(mdev->dev,
 > 514				"enabling stream for '%s'\n", sd->entity.name);
   515			ret = v4l2_subdev_call(sd, video, s_stream, true);
   516			if (ret && ret != -ENOIOCTLCMD)
   517				goto err_stream_disable;
   518		}
   519	
   520		mutex_unlock(&mdev->graph_mutex);
   521		return 0;
   522	
   523	err_stream_disable:
   524		do {
   525			sd = subdevs[i];
   526			if (--sd->stream_count)
   527				continue;
   528			dev_dbg(mdev->dev,
   529				"disabling stream for '%s'\n", sd->entity.name);
   530			v4l2_subdev_call(sd, video, s_stream, false);
   531		} while (i--);
   532	
   533		mutex_unlock(&mdev->graph_mutex);
   534		return ret;
   535	}
   536	EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
   537	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--xHFwDpU9dbj6ez1V
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICOUKiV4AAy5jb25maWcAjDzbcuM2su/5CtXkZbe2kvgycWX2lB9AEpQQkQQHIGXLLyzF
o5m44lvZ8m5mv/50A7wAYJNyKpVY3Y0G0Gj0DQB//OHHBXs7PD3sDne3u/v774tv+8f9y+6w
/7L4ene//79FIheFrBY8EdXPQJzdPb79/cvr+aeTxa8/X/x88tPL7elivX953N8v4qfHr3ff
3qD13dPjDz/+AP/+CMCHZ2D08u8FNvrpHtv/9O32dvGPZRz/c/Hp5/OfT4AwlkUqlk0cN0I3
gLn83oHgR7PhSgtZXH46OT856WkzVix71InDYsV0w3TeLGUlB0YOQhSZKPgIdcVU0eRsG/Gm
LkQhKsEyccMTjzARmkUZfw+xLHSl6riSSg9QoT43V1KtB0hUiyypRM6bynDWUlUDtlopzhIY
cirhP0CisamR7dKs1f3idX94ex6EiINpeLFpmFo2mchFdXl+hkvRDSsvBXRTcV0t7l4Xj08H
5NC1zmTMsk6qHz5Q4IbVrmDN+BvNssqhX7ENb9ZcFTxrljeiHMhdTASYMxqV3eSMxlzfTLWQ
U4iPNKIuUBiKa23WrReRM25CQsHYw1Y4cLdViL++mcPCJObRH+fQ7oSIkSc8ZXVWNSupq4Ll
/PLDPx6fHvf//DAw0lesJHvQW70RZUziSqnFdZN/rnnNSYJYSa2bnOdSbRtWVSxekXS15pmI
iJGzGgxQsIhMxSuLgLGBdmYDPoCa3QIbb/H69sfr99fD/mHYLUtecCVisy/jlauoCElkzkTh
w7TIKaJmJbjCMW0d49Uyz7VAyknEqB9dMqU53cbQ86heptqo3/7xy+LpazC/sJGxL5uRoDp0
DPt7zTe8qHQnr+ruYf/ySomsEvG6kQXXK+muyU1TAi+ZiNjdFYVEjEgyWjMMmljwlViuGlBk
M3DlTXQ0MEcRFed5WQHXgu6uI9jIrC4qprZE1y3NMLOuUSyhzQiMdrIVWVzWv1S7178WBxji
YgfDfT3sDq+L3e3t09vj4e7x2yDEjVDAsawbFhu+olgOrAlkU7BKbLgr2kgnMAgZw3ZHQsqa
o7vQFau02w6BoEEZ2841a64ROWonpDMoWsZa+PB23d4hnd51wtSFlhlzpavieqEJbYRlaAA3
Xi8L7McFPxt+DTpKzVh7HAzPAISS9PtBhiDcLEOfmsvCxxScg1fkyzjKhK5cBfYn4rvRSBRn
TvQj1vaPMcSsvDs9sV5BoAB7hXTqyD9t9Eqk1eXZiQtHWefs2sGfng2SFEW1Bt+e8oDH6bld
FH375/7LGwR4i6/73eHtZf9qwO1MCWxvotF667osIdrRTVHnrIkYhHSxtxHipZJ16YRPJVty
uxG5GqDgWeJl8LNZw/+cKCVbt9xC7s2VEhWPWLweYXS88iODlAnVODhC1rBzJxq3TEuRaNpL
WrxKJgKIFp+Cct5wRXTdEqzqJa+yyOu6BNdaUarRtkn4RsR8JABoF1qBbhZcpdPsojId8TI+
y3Fx4HF6FKucYA9DE3CAYNcGWI1K4lkxmJACEGXARRLQFryiSWGJ4nUpQcvR2UCk7hlYs4Im
2jXDnIqLUg1zA6MTs4rWCDS1viaCuE2crpx8wfxmOXDTslawGEM0rZIgiAZAEDsDxA+ZAWAi
5cH+JZPRpUF9JIYeSYl+rzVBgw7EjQTPl0PC06RSGWWQKofdyykhB9Qa/nD0AGKSKgt/g6WO
uXGuYIyZq5meall77ux8CG8Faoa3jLAdcvRdbfhDmX+ziqPwKF2xAiIXx/yYSLePSTwzGf5u
ily4WZKj+zxLQarKnRWDcC+tvc7ril8HP0G3gyjYguO8vI5Xbg+ldHlpsSxYljraZubgAkz0
5wL0yjOgTDjpFUQBtfIsNUs2AqbQitARDjCJmFLCtddrJNnmegxpPPn3UCMe3EdtDDTownjR
cPlNnuNOBqLpz65OGGNkoIQ2wIh5kri5vBE1annTB8ndWiMQumw2OYzCd8llfHri7SrjG9ty
Sbl/+fr08rB7vN0v+H/2jxAJMfCaMcZCEN8OAQ7ZrR0/2Xnre9/ZTR9y5raPzrk6femsjnrr
PewqhFpPa3ePLGivBRkpq5pIrWn7mTEq4UPufm+SJmM4CAVBQZvc+o0Ai+4SI7BGwV6W+RST
nmzFVAJZkbcR6jTNuI09jJwZeIqRLDCQgrQNC0FkViFTkXlbxhg243y8/MYv6/TbKHcizxvI
b5rEtfbYeYSqWySCOZEo5nXgnLpIy5kUJOFrM4IxrssKV1cc0jAC4RkzB9hv0cZMyzeSS105
W9eP/1p1BgF3etyRYSZviJ34QIL9wXYQtzo+sYxF87kWaq2neqlhESLuWR3NClhflsirRqYp
xEiXJ3+fn/T/9NI6/3TiyM7EBTKHkaXgsfvZupO1tbwM9hQYw189O5KBgGBLmCkZi1C+PN3u
X1+fXhaH7882NXKiabdpbiZ08+nkpEk5q2rlzsaj+HSUojk9+XSE5vQYk9NPF0coeHx6dozJ
+TGCjy5Bv+sGYZCWZZDELBrFMEdwOtscBDCHxtnPNj8nTEU/a2Kyp7/ONDhvqrrwIlj83VlG
chyGYFKELXZCgi12UoAWPyG/FjkhPosNpec3PR9NFEQ21xcluouPkfDTG+OuKC+RO7amUCal
urz42OurrMqsNoZ4nEJUYK4gf96So1vdgARpIQHq7NcTYjCAACvldmS50LSXzrGJHdBKYRHP
MYT8msfBzwb8VWiw8ZjEIstaLdENbt1BGJpJP9sWqQsZlW4jiOElnsfQmRM6WzSlXiZjesB0
AuNCstg0Z1KNzc33D08v38OzE+svTPEVQhvwpm3XNHoIOVy8bdRVu1u9OEaj4K9N2FNLpcsM
PE2ZJ01ZoT93cgIJeaKp3mBEICFwUZefBqsA6cJqq3GkoOT68uPFUEWB3NtEAK5YzZFWsoX0
G7y5wZKi9SRnS+u/SK9O3HP8nAhJxULgqWEHpXURY4anL0/Pfhvsvgbv7mUe8UrHqLeuA4Yp
1Y634CzJW5KhIO6NygwreXt4Btjz89PLwR1nrJheNUmdl+SMvWbO3uYxWotRgF8+/Xf/ssh3
j7tv+weIuAP1WokINoIpbWI+qUWg3WVOa3TIdUivr8JEpeCVSLroYnP3cnjb3d/9rzuYHSLS
iscVWAMsN9d4fGkHtay59mxiOfIfXde5myCWZYaFHLMpPavQIWBVqbOdDi01wQxLN7p2usFQ
rFltS8g40jBeWG/yMQQPTPyTHReThlleC2+UrP2ifI8dZcoIZHpbgFVMaWiD/ydYYdiOMfN1
YwJILHn4DDapGJ1q4gCLDaxXAlt2zb36aE+xMccHpnshvQJLTwJxtF8l8PXAG4g/KrMGNQAq
Jd32eLCIK3b54IN0rIWrERa6wRIgoRAGOya3h4g2wYHAesli6vTGDG3Q4HbzBHvAlq73918P
+9eDE2PbeRVXosDSfZZWAZuhiXcAv3u5/fPusL9F9/LTl/0zUMMGXTw9Y2cOe2tm/MKP9aZx
UHmUNl2kfKJZvg7vtlnb7IZo8jsYtgaSXO5WhCpY5Bi632p3qm4nPE1FLLAmUBegFcsCi6Ex
HjcFfgorEHh8AfulifAEOVS2MO+yUMUrGmGhDZiiNCj+GbxXVxuOgg3pSsp1gIQ8GUuYlVjW
0vUZXd4KgZ05n2yvWhARD7jZSqTbri47JoC8sfXlAfKKFZjdtj7VHKDZOyHhBHTe5DJpL1iE
AlF8qRuGOolOuV0DMJGhGNoil+cKsEKE7Sm4KaFbnuj7KKFSqkNhieJcntcNhIgr6MMmw1hi
IdF4XHaEBGyV/WskfasQ9oxqVAa1Q21110reVBkCiradveUygUtkPY4FcX0bUcaNPa/v7s0Q
omqDBQyqvUpBe/fIrELrkaUyB9gBl9kD40ETYQIwVaDDAu9xFrgLJjZTgYEu7n48TyKEZqcl
06pJgO82wII2d+Eyj0UqHO8HqDqD/Y1mAyvhqDrEVAyqi/TDRZHltrsaVWXj/ZIJGzn3RS5H
4BkWz/C4D+LdRDtHKBKvMYmlrmHIRXI+QrDYd4ttZfP8DKLrhhC3mckmZ2Ufanf+jIANK1iB
Uaq6ZEldOUcAM6iwuZUx2dxD9d4DEwu3Akz5kb4TmxvFamvCFesLY7n56Y/d6/7L4i9beX5+
efp6d28vPfTdIFk7gbkODFnr49ojgaE+OtNTH9tCyoVXciBuiOPLD9/+9S//ZhreKrQ0XkXJ
AZMx+Dsdfp++grDxeMb1cOYkQ2O5friz2G4Ir9xjF8kmeJlkCVkfaKnqYo6icypzHLSK+8t9
/gHZiFLQtz5adHf/bI4GS7xXTS4g9Smc095G5KZMS98MK8BawC7c5pHMaBLQ7ryjW+OpEVUp
a02PueCRQazgXgeI/OQaz2khDzAF6WB7IwpjWrA0n2svcBquGcAGwxjLR+G5b6SXJDAT0RiO
acFSiYo8P25RTXV6MkZjRSAZg8FoyqpqDyKGq0QjLEjnijoQxvnlCdZrrM9TfhdXES0MgZd5
wGRsJ7CxDKUInJr883iQeFCQUmtrFgXr8iXrL/2Vu5fDHW7KRfX92a2mm4Mak+2yZIPn1t5N
DQbxeDHQkOrGxDVN0TkNnQ54j3kOruQY84opcYRGRPnsAHIWewPowDqRmh4ZXihLhF6biI7i
KAqYtK4jsjXe11JCN9e/XcyOqwYm4Hr50JXnh5KJWTnH+ROS6fhnYAmuqanruqAnvmYqP7Yk
PJ3vFi/IXvxGdevsF6frrqwTaKirzflnLJX52wJgGMa5VYEWrOyBoK3IyeHulaP1QCWkrQAn
EDr5t+Ad5Hob+VcoOkSUfiYdo9/fUGHqrmNC+iT800Dm3/lhujgNohl7Sx/iR7z2rra+cZ6i
aKLVDNERHu9j4N/KnSTRbFTPdcnQZ88OxhLMD6elmR/QQDRccSJobSw9J2dD8Q705JgHiskR
eyTTIjRkcyJ0COaHc0yEAdGsCM1FwnkZWpL34CeH7ZBMjtqnmZajpZsTpEtxZEjHRBlSjWSJ
D2mO7JD+LJ9VEksqKneK3ybYto3Bscurwo1OIByDrGUCaYY0gRtSK3vTCObBytJQGFvL/97f
vh12f9zvzZuphblu41YVI1GkeYX5bMB0QJhynCMJAIUlQfxtyjT9Mw5sN33nt2WuYyVKr5ra
IiD+jolm2E1bDOqt+9QM3YO04WBiXPfsT8zCGoE9/sKEgbs3650DuGs8GeMUagP/wTw6PKMb
UYw7NYE+eKWENzN4PDsj8CnTVbN08wazlmvOy76tl8l554BU4GCP98zRnj1V/jgsRl6GVQeI
HlVQnzcjZUmimmp8oB1BNk9ey8TqWueZB15r7axSp2lG0BD9mU4uP5586k8SJ+pETlI2xkNK
dcW2lM6S1Lm9WjiMKqQyFb2YQYDi7ZeMQ1yPUPpa2sQla1ScoahFktyUUlLh8U1Ue1nEjba3
8uiXWFwpvyZpLgAPszQlaQPHAtbaK/fZW0cbUyt01IArLO517z1a6BKvY0PmtcqZ8hTTeDZZ
ZFhIK83FXDKt6s1fWXFbzGNeOWZ6/3cc8EDou/MDJrpU3imCXke41XnRVb+NZSn2h/8+vfx1
9/htbFLwBNtla3/DojFHTJhp+L/w5DiA+E28YiL8GC7GDyoN0EpSO+o6VQ53/AWqvpRuYwPE
uvtEc3sOmDK/S4OBvAvP6wR57GUorGkgWuJZj65ETK0vLsiae9c4WlDHj2gk6njj5bQpQshb
M07hF3504h4GmJTmKQD9OkFY3RnykNJe8Y4Z+XgV0F06b85vgyQGq+8R1om43SQ0B9NBmbXP
cd2nu6Vl2lKwahVwt9gNV5HUpNQ6kjhjWovEY10WZfi7SVZxGfSBYLyVT79GaAkUUzTe7L6S
fNZqUUsMMnheXwc7tsRLVIV7CtTTe6PO2wkGD6L0tgCYXAu/yml5bCoxMZ46oftNZT0CDGN0
lwyRbBUAuPal2sLwBuhkIbUjgv0ZT8jezia8EuJifVtjQMCNAuPMw61iEIpdGcRcF7CC4Fek
U2vDXuDPpVvtClGRe0bTQ+Oahl9BF1dSUoxWla+1A0IHshsRbCP3KKiHb/iSaQJebMh+MEzH
vTvXVUYPccML6sZSj99yV5t6sMggb5FCkzyT+Mi042RJNowiRWpaF5bBytCxhcF2KzdqtprS
4J4Al2GWwizILEWnH7NEMPFZvKJXo0N3grr8cPv2x93tB1ewefKr9t5NlpsL/1frITD9SCmM
+eaCb30BZV8yoTNtEka99sJdeGFtjrdzL9B6TBqOixnLgd3mogyHL9ytYnmEttLQgXkdzUIL
2n1uHB5+CzD0Uy08a9xB6LHM+FYcVR3hwUwItj6FBB5hWIpcQx54FvbDlxdNdkWO0OAgVo4p
uPf2LC+tnXN/dmo2pBMGivymPrgBC4ffA8ELAm2E7vi1sirbYCENIzTTCDI/czQF4UxeBg+y
B9LwzkEPItxBpEQCOYfbqv2Qy8seI/Kvd/eH/cvoYy8jzqMYf0DBX2At1xQqZbmAhMQOYqZt
075KncSbb1EEEgtIMjkrrp5O6tRjhE/3isIkZVT71L6qDgKgFgw8IaHwwL3iuj1YIN4rosO4
ngL3/RES2+cEUYVPr5ecOtBA5PDS2msTiM7H4RdnJtiNYjmAyeh3a4A9LtPfErFYWbGJPhT/
nfsvlu1EJq71IxKy25U/KD+TQ4jNUYKh69QH4H226y2ll9f9MpvddG2qaa+L26eHP+4e918W
D094dvJK7aRrfOek1mHTw+7l2/7w6l6u8NpUTC0x+MUHVFO5wIjavIfWNXVNlyQfTNMMVaJd
O0lRrLIj+LB2QRFhwcS8an3n4DPX7JEEcjlP8J5RFekxO+PSdmZrhggzcu/KAUVU8SNcek2d
Hby5OvXOwVP+a8wwLnPaKXg0EGThZaUy1PmH3eH2z5ldUuEXgZJEVdtyav6WyHPkBD78UgRF
Ahbeq1pTNGU9i09iP1OiSPhm9PGBGerprWYJeFzM4/WxAaGxnLTxBPnU1rZoG/UeIVGsWE44
854qO6veKaOMF8tqNdul/WraHIUXIJL4GdPQkpjQVap3WGfboEjDz/XMUYNzep88guMugsJW
HY9MBw8hJuMMgnxd4S593xCNvz/Sf2sX39u/4izL308cw1Z/31h1XB3bQjaWeG/nffX2nf1X
/ocZCJJZK9yS2Ptuc+Oqz4Onrd13nuYyBa9UGYS3A2LjV103epS+Iyz4oIwFQpxlX7udnrVX
YcqNXhxedo+v+HwL74oenm6f7hf3T7sviz9297vHWzxhIF6FWYZ4KVs2k0U/h6ZO6PR9oGCd
gSVwkwgWlpl7DKra6PWZme9rdxnH+SykaahU2MmVCovkAMzoD/21LTJKFS0ulSF/uUlDUBZl
MdEnQKnYrV3sVchFjyD5mIYnIaj43EUVRlJ6NS0svRrU6TenTT7TJrdtRJHwa18Hd8/P93e3
Zhss/tzfP5u2Lfrf70itU6x7KWbqEc4HLQFu7ckYboM8At7mjgG8y50IRFKXHdRLq/A8BeFH
UtDgOMKZEcnXpMqTbRA5mhI5clgRQIlynGJbTBswrmil6wm8mMlFqDKsrLjYqspCBE3eBfZd
4hrwKpb+Oy+vEYxtcvRdPF1l4+aKXU3tcMCC7K3M6Mt+M+ra6vN/Lt6n0YPmXkxo7sUlWRlB
zKxKXUyohw9vdclzLReB0viITmcmELwWFx8ncLh5J1CY8EygVtkEAsdtr//4y+uQ5LRqX8yr
sIuuJnlrNcOcyOtbzER3k3vgwtsEPhiU+NJ98D2rdqQdveh8QcLjx/1hTmmdw4nYfE8ubZaK
RXWGX0Eg98kxnmOLPKp7plVXkM2594k8q7ohfVe8TRsehfrb4gABf/oFdQdVDQs03CBy0QVZ
RXNIfjs5a85J3iyXwasDB0dae4fAfb/tgS8mOE7lqA6JX69wEP/P2bMtN24r+St+2kqqTupI
lGVLD3mAQFDEiDcTlETNC8uZ8TlxZWaSsmdOdv9+0QAvaLAhbe3DJFZ3owHi2mj0pb+cBDir
wOO7Q3LKGLUv4w+uRZVdyPrjAjmO4BZ3NKoWsazR4nGbbBmS/RTQ5TokMx3WRNRvH/QZ1Ks3
BoB5nubTe7ddeBpwx7mM30PHRM+oA6JoHofMRa/odRiqYmpAHywtff70h+ewNrA39YbZewzw
NYcHJkwdk0ZwsnIf3MG7NNdjy+B+4X64wRgfPPLFGrDYsIA1uVte/+x4JummAVLPYep+Dqhd
HT1s7n1uFqo/eT4pJv8OWk+jmtn6Juar3Oe6O4uy9N+6RkJYeLAFLam4fnbndvn2e7l9CSZK
ZJkzFPpHhD+ZZdQTUButnUKscty6qrT0WvCQleeK3CykEAK+ZO3KEyOsK7L+DxMDU4IukmFB
b6K9onDIGbdEAROcIYqtWRNPP15+vOj5/c/e2QNFtO6pO75DXlsDOG2oAH4jNlFYoWagdsZ6
wKp2nV8GqNGmPc3hNfbsGsAqudYalRCcGvGUEdBdMgfynZoDRUNQNqz/nFkL9zUZTHZAx2r+
Wgxw/X+R//p1zi+u6QU5duATtOQqiTrsbtLwtDwEtHoG/0R1LS9j38QLwMlTCMPZQVD0c1ia
Er1eSV+5NdSnMVc/L2DDPY3xzL7N9P08Aps9Y748v7+//qvXCuClxLMZKw0C/+GQJtDgG25V
D//jI8wed0+xTOir4ID29Hw+W3Xy1Z0jnLyhDZXqfY8qx6+8dtgOqJIpvIzLzVNiG7i5qqDo
sIAReR99cQbrvfJXEYHi+exDe0yxu5BWsg6J7kSyPk+snxCNaBsSwVkhYxLj+XkMfcDIEP/j
nJeuyi7mzmEVFwqiYpeQ98U5nPWmzIzbLDqgR+jwJ2UN7FK51ksOPEaS7wR3wyc54BwsgQMN
6ZNkXG+Hp0R2MCaqbYA1PIyGRJCyEsVJnWXDqQvyqTd2nqocIDN7zxGRaYFnNwvHNlAZb9CR
mB5qY8iCpcG8mm8wAOv2ipInDWqIifUVQfW8s3YdaFkWrn42Vd7itP2DbWHgyX2ll6yCZ4YZ
qvBiSMHvrhQ5uNd29jWe2hdrNzpWnZhMGe6J0rr43h0dqsNShoOY2W4bARLyJ6iLF09r94QE
MohW/YG+k0KEsKYWLJ851QN32N3GN0nXNeIOglHNhDB9e7VRXdDYxnVZdfoGLkPqihlPD+H6
YYz9wlA9+qevWXQwO9f3AgD7s1/4w3K72s6PSS0fxy//ef30che/vf4HuTRDqRN3Qx4bSDsD
qWwGsnMMNYCzjIPCH4w8A+vbtJMVHzup/6LitwLB4cQguFLFpXAjxZkqullDDEjLFqyBMPqz
Nlksp6zkDZ4/Pi5mhQDYSUWZSU14p0oHJxMJ/09in2kO/w0wrAQ7kN+rPjCITIqBIlfYtx2A
yWb5sFhi2NSRGD5U5zdxbAbp3Gh6uZ1z69sI/UUj6I4CRzH72DrOU1XpYYLQ6v96/vSCrLOg
QCpXy2UbaFnOq2i9bF2VJsFxrOmodrgmh9UGgnlognmnWyBqlFAxgCkpz6xSNefUjwrBLOc7
1pmmBZaOGSCPwEEfhy3F6QHvSzE/GxHEumnR7xXE9jHqMhK9ddeuvmWAzN4eJkRh3hKyUpHu
cgPZTFFVt4eAb4kuc+BkZHr6TIBXt/qItLtnmbPW+9l3jYlB/usYYLVODtI9pOxvsIZTM6As
qiOSrnr4viLjusIxs8XGPPr3LF5FD/YkL85kgn9RFFAYiQYGiOenqMCCB8/MHgbG/k1zIZR5
PiEEJ3MFYPKxyVVZJKBu28uGZRhY4D2qB3VmVVMsDfbI6gazSedsVBrjl/heNHh+u0teX75A
koevX398G96cf9Jlfr77bBaCa0KnOTV18rh9XDBcJUp0BwAwVlq6OzkAk7iaAToZcb+1VbFe
rYI7w0Shi16liEznBPour09e9wPE36cm+HVO1GdAgFM9QNda2ZNcGeG2IqeFBV/nvUrOdbH2
aVDt23WauFvo/3FGDEwqxbRY76lXZOIAHNeJSa/bw0CWpVSvEMC1d9HuQVqk1ssN5YoxOaFM
ZFvWiK71jfAsPnfjZyVMZiW6n4ombcoyG249zh3ExDTthfDhyA6JlTZIpism+D/6nI0KAQUs
ERSZeogLDyWAAJMzlDTCAvoDBsM7wWvukaoKiYoDjNI2+SQVqEv6sCBzBgYLoTYsDTkZJ+Kr
uZ9M2+PKa3pXNbOmdzvq3gDdliuv52dZM11G85caB1fb/CJDZHWcyBYIVIPzzphhSww4wBI5
2wNAlicM0FfJGUumr5AEQ2e2uEXcScTpi4BLolK3wxHG5jGxsdE0n09/fvv+9ucXyND3eVwC
/cJ4f/33t/Pz24shNEZ9arSRQ6N79gY3PneimsNAhJ4Neg83kRqD06enEZXfjbk+nAtS5rvW
fCtBP39+gZxIGvvidMM7MgQcBMibtGM0L7pPx/4W3z7/9efrN9yFENPaZJDB02aA9vnXEm+a
CT0t/fjUqIqx0ve/X79/+p0ea9Sd6tzrZRrByV69zm1qHWd1jMcq55K+idax3S771v7y6fnt
891vb6+f/+0KKRd43Zq+3/zsysiH1JKXqQ9spA8RhRgypWDKUqVy5+bQY5WM8fNMD+oaJR+j
JaVw6gliqWzYyFKL0KuFj+53oLrtmtYIVoqqBWJXi2IvA+lsR7LAljdVdsztywFVCYQGoW71
A96E5ey4FbttKtbnv14/Q8w3Oxc++6en00nrx3bWn3oPU11LwIH+YUPT70URUa2vW4Ojn/4D
DZ2it79+6s/+u3IMMTJWcbTxcFORVeQFQPdIk1dYSTzAuhxc58hRUw0rYpZdyVFsqk1knZs4
iSYz7EzOT17fvv4N+xsYMrt2qMnZBIxFF8YBZALKxJDH1RGY2qZmY21O1smplAkUbrvB/VaS
QItkWRbUVk9F6Eix/bj5Hzferk3oWFBuoDhVY98bVUAt6fvaqCnw8khZOOylfdnOZmOhRyfv
nkrVHY4FBH0OORwYZjb7Qs/SxLQnaS2rgUyE/ITVRUHaC1GfpHKj/owpvCGut5ZnTEU0+nTM
9A+2k5lspKs9qMUeBbqyv/vrD4apTOZIwB3gbjT6EZbPgXnu6gKGmtyYcbDpqZTVdqImeM4B
MhFa2Jw7p+EwzfOVbZbN7se7cwcei7jg8XAq9YXGC7FUg/A45GIcG7UvQhGPG1rjU1J3pIrV
OA9fD+hYu9k8bh/miGW0uZ9Di7LpXAGwD+7rNniI91scswx+0MZdPREIYUrF+mNktYra9irx
0UvyMiOAx6yrBHG9ozttbPQNvDrcwLebq/ia0V/A47rM4XWFx6eAIg+kEljG+hI627DVP7Xw
fffblz8//dFPtfnBOTShrXQjpve0mCulUQ6AKUfLDr+6KSOICxX84BMmroRjIPhh0JZzjw+T
bsnEtXPsSvp3x1uT59Zg1gpPKKvDOuViftsA6CxTyjgpoAihEYEybrwmF56esY8+wBK209ul
8qHcA1h7ZRJoZjiNSbA6CWH8dUEQDXF1Br2O20s2FuPr+6e5hk+JQp8YqsukWmWnReSmOInX
0brVF/QSXc0ccEDT5FKgrV+fyfkF7+dVyoqmdHSJjUxyLw2OAT227dJthh6H7SpS9wtKztZn
QFaqo5aPFJyJKFt4qk+UDIntrIrVdrOIWEZG/VJZtF0sHLNlC4ncpJ99LzYas14TiF269N7h
BoypfLug3n3SnD+s1kiwjdXyYUNnjdS34EZ/qV7V1aq/FtISpreFUbfKxkvy1UJ22rZTcUI+
nUG40E7fUlDSCB75/qs2IqrQm1FOudRZjN4nI8recMI6BpQ90CZ8civvETlrHzaPVG7HnmC7
4u0DUXC7att7Ov1kTyHjptts00ooauh6IiGWi8W9uy69zx/Fid3jcjHbvyw0dIFzsFqcVFre
bdwIic3Lfz+/38lv79/ffnw1uZ3ff9dS82fH3/HL6zd9zuh94fUv+HPaFRpQdrnN/n8wo3YY
vB0gjKdOZ2AkzOA6VGWzOSS/fX/5cpdLfvdfd28vX56/64a8+yfCqaxwHsCTu/PatGH1kOpg
8BK5wtgRms9PWIjWv8dH4E7UdQm3BA6H/eXXhTNzeEpaz8DqYZkefKxHHleVr/GbEKEXk5Tt
WME6JjF2iMrpngRW/OBKDnLHrCNNMou8REqbmslYr8WGjC7cZ3Rzi6N81AZipOVknK2mBX3V
Ni3nT3ou/fGPu+/Pf738447Hv+hl8/NcGFLYDiGtLZS+eY2FaGvXsTS52gYkzjWp5HTYeHD9
N9zmXRWwgWflfu+l2DBwBS/W5l44Fw+hd5phqb17Y6MXlR2LGcuEzwcJU0jz32sj2SmmRvY+
PJM7xSgECuA/Qm3CPzemg0XVlfMBQz4975u9huu7vnm8Dn9anJKzn5rro+SC0g5ogb2P12kX
tdNqwFX5GIOEO3rfv1+//65r/faLSpK7b8/ftRQ/GSg4IwcsWOoueAPKyx3kNcrMU4sJrbCY
FSEsTgxOFpIvH6LWAzPQpFJ1KZlFnqOGBibU/TMn0sXkaO3lsVExxALSlJEcOojfzpxu1CDY
SBYzyHIOWXh1AfB+TVkRayQZhFXDzdsXFSJ3570/2t9zO40e3i94FTybx/tqPiQ/nHdfjJ65
4jzIzDBBuT4HYnvzAhdIttc3S/iB4jt4dDadX2+fiqh2+rZW1VK5V57YvN8pqRrQOOKUHDFk
UzJheLALhYYbryP6K1TBKpWWDeLTpLKA0+AkIcCztzECPz9M94QySQNmwb1jOIOpBwVglpWF
T5xLWNzkPqKxMM9CuI+iph0egOswBUMEscgYNRUBdcTid5yb+N8hTlYVHcImGTsIOli5xuoN
TgZCmcOAzSyVXSx4mZohoI6OOKfyU0Gn4dxTQ7QwfOPjurSXcgtgoMRw1wHAKixuAAg0zs77
z2AiPV3Mp1ukOSksnDr/dtXsNp8ccRpH+7uXbCdddg9lVN/0SDDDUnvhZrjuMSgnbw+bxAYr
Awsh7par7f3dT8nr28tZ//t5LrslshZn6XbtAOlKdB6MYP3JEQEuUBeM0FJdkPx8rVGj1sJY
aeFLeTFNgWmvLYs4ZGdrNAkkBtq1P+oDj768PZkcxgH/Q2NPHbCvMYHTAsq/nHHfqXeaYVUQ
dWpDGFDMB94Y9qSLpG6BEliBJBoQQMss8DoowdmQ4NQcC1eTp392JzM6JsMyGTf5JPRBO9f+
FaEwRllOJsmCWk41ivbIak63EjxK7asIEnoNODg1ABuK1dP7tPo3JgcrijBOy136bKUnFeBl
3Dw+RmtacWMI6JDKgNJynogWC3oYgSCQxAJQevhLWvi3NpS2Byn9BaTTLfzcDPqYifUtdcVL
JLo0lyotw0NqC7GYVQ2eoj0IxJIatpQbDLSEg/YH0SxXpL20Wyhj3AgJSBJUWq6mLXRR0UZ4
yfm4ngP09tCrKxoytL/LNGcfy4LsVYbFaf1zs1wu/dcCx2xClw163w089XZXNJLRFdachsPY
l966ykJzN1sGEaF5mS1DnXhrNI9aUEOx3iykK3abzWJxvfCuLlnszdzdPR2daMch7m1g/9oV
Ld0ZPDQ7GrkvfSMEhxn9aKYuWvDOgzEAdcGQ6970wZzF+EgtyMi4UxkoUHBBzgvOTvKIF356
LOC5Xn93hy07SZLTbZLdnu4Ml6YO0Nj2QVhsWj8un45gFHIV6bWR6IRUZApb/fSgrqFXwoim
J8CIpmfihL7ZMi3Lonb5mxVRBHLXF2hBxfR56xSKZ3KGFhKyYNqQoVRvbztVlEX046DSIx0w
GHX4CX2/Eui9YSeim20XH3kqK3J278vSi6W1P91oQ3pkZyFJbnITrduWRulbEbKOhjcC6gju
HaMQXUAMkHtaD6zhgUUn21ARjQhUApgQu/tQyzQiVMa30BhuF/lyQU8Nuaf31w/08+7U5zmr
TyJDvZ6f8tBmoA57umXqcLlx4Oa6FlaUaGLmWXvfCVrQ17i1ufiEsOp8FZ1QdtFueySv8Ww7
qM1mTe9UFqXZ0krVg/q42dy3AWdDr9KyX2jObsSjzYeHBclaI9voXmNptO7Sx/vVDeHA1KpE
jp9KFOddyUVWNoQyg2BywfbY8Hu5CEyHRLCsuNGqgjV+m3oQfTdSm9UmuiHJQBiP2k+wHAUm
86nd31gc+s+6LEovpmtyY0Mv8DfJrjXp+EARCeFmOl98mnPYWHtz5ySJDrcnV3HS5zQ6svQF
iYvYk5PnBcsDarGmJ7PvOSX6vHHWxhbJw6mW4/UEJzv8IsAOMZE37kOVKBTTfyFtVHnzyH7K
yj221H3K2KoNGF49ZUGZVPNsRdGF0E/BADNDQ47wZJkjefCJw5u352s/qRzym1OijrER8sPi
/sZaAKeNRiDJYrNcbQO3fEA1Jb1Q6s3yYXurMj0PmCKP9RpCLCBrRAu5zlGxXMs7+C0Qjln/
2keUFOKJbIhJtZ7of2g9q4BeS4FTHozkjemqZIbd+RXfRosVZXyDSuE3Sam2gS1eo5bbG2Ot
coWmh6gkX4b4adqt506Nkfe3tllVclCS+aFWBmxjDhz0eU0OuXxuD92xwJtJVV1yPY9D4vA+
YDXJIdhEQCtVyOONRlyKstJ3TCSTn3nXZns6WIZTthHpESeOspAbpXAJ8FbS0g1kKVKBZ9yG
jpTo8Dzho0D/7Oo05BEBWC0G6mEl3wAdtmf5scAPBRbSndehCTcSrG4pIqwxlcu8N69irQzv
nkkc0yOt5ayKxuTW/eMUErR112eSvgVYuREkwu12HciGW4XiA1YVDVdeAcfy9VsfXyRk+5px
NRm48obnKJ6MyTg6AvTq3tMQa53tMOJnm8vDUV5L5S22wWzgWjsHhke16+OpzFTTgOKsoQcX
kAd9mQzo+gBdQVa9I63MBXzdZJvlmp6bE55WXAEeZOxNQIwAvP4XUogBOlX0qQo4WaWUzfP5
NWftHbwRfXl5f7/bvf35/Pm3Z93brgn+uLrgsUxG94tFPrd66ofoJkOH342oitQInvIWVK4h
aUovNCWDWSNGZ2RqbzghKUr/7CrPdLo3e/vrx/egmdYQj8H96UVusLAkgUTWGUrAZjEQochz
BrAImzf9kDM6eymQ5KypZXuwriKmucf3l7cv0P1UIJK+UHlUgqxxwIDH+ZG6Y3lkSu9XWpxt
f10uovvrNJdfHx82fn0fyouXoAShxYlspTh5FhvOOIW8x23Jg7jsSs8TcoB1LKa3CYegWq83
tKeCR0SJtBNJc9jRTXhqlovAboJoHm/SRMvApX+kifsIZPXDZn2dMjscAi4DI4kffoSmMFNd
3GDVcPZwv6StgF2izf3yxlDYxXHj2/LNKqJ3F0SzukGj98DH1Xp7g4jTJ8lEUNXLKKAmGmgK
cW58F2ufBgLegQLrRnX7MosTqdLef+o6sWrKMzsz+pF3ojoWNydLk0ddUx55GrKQGSnb5iaz
vDl0VU5e4J2NyLFsg596f4sIUMcyN/bcBN9dYgoMWgH9/6qikFrUZ1WDHFcIpJaSkLn0RMIv
FU7XOaFMpsvBP32SHke80GIFvL7SQubUCAFK8YAqwqnNDBUZJW8iSkoOKgHXTNepqP9Gj7kS
tcT3L4TWF7RMmMp9njuer7eP9z6YX1jFfCD0hW/mjjHB6C4emfmKK4Qn1bYto576LB52QL91
0zxAnp0+EkVTGo9OyECFdDADrGMFo3McThQrZ0ZP0FgSUF7uakbA90lEV7+vyYcphO+wo/CE
O0p9RuQlNd1GInjN0WugIRqlZCzOEHC3JpBNjlVdE0OjzqSfOQaaM6trGTBZHIlytjePEdda
r+U6Lsp6R7UeUDsUHnfCQWA7rOyaPuwsY/3jets+pqJIj9QEHUni3ZYaaJYLjjXfU83Helfu
a5ZQ4uI0sdR6sVySDEAGPJJptkeStmIxWRYQXUI/dGEiEMmvVXFm2UFPKS1ZLYkOqJRh4lkb
EuiONOOeCNuann+JkuyBimdjF7vJHOLMdvvbXPP0fOEsplGyskraOWrf8JJEpKzQtzSkGnWw
B8hhQrTSIelvzAQDu93rnuZlTvma9Z8KG769MzgNnIBgtFyJGnvLu/jNpso3Dwuk6nHxLFaP
m3vKhB1TPW4eH+kaDG4b5g/Y4KFCkNJhyTAhDzSlyUXW5a62lER3zSr0MUctlsuWy5rG747R
crFcXUFGwa7glw1v8v1ySenmMGHTqGpmi0qQ/C9j19YcKa6k/4ofdyPO7IAobg/7QAFVRRsB
DVQZ+6XCY/vsOMLd7uju2e3596uUBOiSwvPQbTu/lNBdKSkv/6RZJevHzSoYd6YaNMKh7c4Y
g2ZipzIUWeqFxIHBBt+3OHjKaDecKlfJynJ0fJFNwBp0nPl0c7BMeaA5gFXBw/lTNQ5nHDy2
bVE559aJbb4ltpSrTFVdsVEz4fkP0XAfR77rA8dz84Bv01r1bscD8Un8MaNLFVhnQqO5KBx8
SbveJZ7nLLhg+Sejl50kfT9BDaw1tpxtqa4upHTw/Z0DK+tDNlxp1bkYDJlb67umnCrHgKW3
se8Y6Ow4yp3vuFqnLMbrYQwnDz/2q6z89746nhxuXkzWO/RJWGOrrhkNgnC6joNjlp/zvb9z
NfbW6nlXjEk8TeYBRGOhCa5QqzOl8eScdoB6+CWOyebjd9EWG37dobUJXK23tGuHCg21oA9W
P4gTxybCf69GwjcZvCOHnC9n+BWTwUk8D1fqs/kwE3WbK94oFsDXCnW9q3L29Do6xJWhqktd
utXRweHuQeMafRIQZx4jPaBRCDSmc39gomTg3siGKYlCx5IxdkMUerFjTX8ox4gQR+8/8JOX
q+x9e6JSysD8umtL0+dBU/6Ttz+V/notqLOMeG0b4w5KY2Pymb+zshRUXSTQEK0JJdJXD22T
wauzvBIySrSnmesdSV56B5PHWmIcUZ0BWdmBXi8VO6xrHpLml4IpSUkoamyBYn5eu7tefMJi
oFmyCz273MeOYAfKGQR3NEwiKK3icKgoIZgQjvF6WM04VtwT2FgSE2K1YofnRsIWOo2fUrv0
3K0qzdD1S3Dcl5nus1aQc+p7SH5gBMWjT8qOdmbbl+NZa20jozP/4UzeZTVle7izu7r8kITq
BZnSsH07Zv09KP9hbS/E1WWUGMUCNArsWWOwiS3t6rilnufKVAc79xtTxcMRnO2Gz3TJVSOb
+6wsdX8hMNnl5HN+kvNFoTJJETi24Z5WO+vswon40s0h3Tsbp9C9QTmo/m9mitgJDToppF8P
k9/3LQoxKYFnUXYmJbQp4BGGv7ydHr8/c9eA1e/tjekqQS8s/xP+192qCXKX9cbDmKTncMuO
NKSA62ovrvONZHjYE4FJyyHtGUB+bCBgRGxnl/X51SiGwSGeuBwsZ0uAkQBcrumtMVOuzRCG
iVqSBalxEWfBS3r2vVv8JWlhOlDjmLG86WM9unprQd7DhdbAn4/fH58gqq7l8GoctdXkgi1t
56aa0uTajffK3BJOhpxENu3gWEHCSO3FrL42wg1IIR5754HLAzLpjZ3f53VW6Iqm+f0DXDHj
V720nTJhTlA7BFLOAcEAR5eq+32Tw66C3nrO4PWoqsC1D63qubFSja/ZubuodfOQ69FUqJk7
Alw0MrGywcJkct+DRlctb4Qjqr5Vc6e64IICnIiuZSrKCy11Vwvl5dbwRChUkV6+vz6+2cpH
siPLrK/vc77FCUd0719/SwgTlX6IdNx1je09RyRmQk+ghUfQ6JM5yTMRf6DGDzSSQ78sUojc
9Uxb2+CngVq0Ic+bqUMKIIA5L3cxhtyPqsE4FJqY88LBYsQvyySbXC0/jdlRD4OB40pDmB90
cF73913mcNippzTjQ5hs1WGKpgi7b5zz0W/gV+rHTQ5MTS9dQ/tWHn3n2qMYeBjqa93J1jNT
ruDHheC8VXOoywntCwN3DkoKZy8/CP9bcSRgTEUjBSjzGO+4CpKPPV87nKaTDANnJ82IWxlx
CFXU6jotvMzpMnvw1Wlc+XChSGt4q/ZVRyt45ChqPeQ9Fe59ZocrqwTJkQwsIC1/HyqLUPgU
D5NwkDbyVpdrQRiqg/WdOwgaWaAPt6IccFxpDwctr/3Gt093TApqCtXT40LintCZSCKWaQs1
QwStiIxYIOnwSl8ZBr5M8nL7fGaNf8xPJTwdQgGUW4Gc/evwoupxNThnNbhu+CUKb/b8AcT4
hITYHKmaUj07qWhzvrSjCV5G8A/Vt9O9nWgYg+Ch0x07mZjrKsdkM94ZWf+iTh2FcuyTIXXZ
O+nYBCRWLy/533Kj12lqSANJQhZzQHzs8izP79DFP687h/zAoctIiFEehW7N4ROFFeBiMLcH
5fgEYxQiOZez2CDaCtza3fw5C7e21DCnurKTqb6xrkiIGkxcaN0e+0J7nb/QHBPwaNv0pfQG
r8iMDXfqg8uc/PMXesbRqarre0s3ZY6UYQnl6jwVs6s/Qyyg7ozmrjHt23YU3uKt0Qhj21aP
1S7J2LziSlts6rU6GS6S9VgknHpizLh+KEPpeZp7l/719vP129vLL1ZNKEf+5+s3tDCQaFbE
0T4F9HrMd4GHvQzPHF2epeHOxxIL6Bd+4yF5+hL3qzPjtJ7yri7QftysolpO6fNfD6Sz6C/p
pKw+tns1pNNMZLWZ2xY+tpwHwSn72q4yQsgNy5nR/3z/8fODkCYi+8oPA/y1YsEj7LZ3QafA
KDEt4jCyaODJQydWiWd1Hju/YJZDAHVVNe30HBp+XU3MTIR9JBtZ+BzizV+x03yKrZoSjQLP
zBZMtyL0joyBhhWOJHW6c7R1av794+fLl5s/wKu+6Jib//jCeuzt75uXL3+8PD+/PN/8Lrl+
Y2esJza+/lOfOzkbP4YWG5DZ4bk6Njwuhn42MkDbfaLBMNRG+CszA9RKFZjsQvG7GO54UAbv
0m7ECZgnt31pTAc26h2lHCpquNEBqrAgspq7/MWW269MkGY8v4u58fj8+O2ne04UVQtahmdU
POAMdWONORlcwDng+nbfjofzw8O1ZcKmk23M2oHJtvh1AWeomntHeFAx5jpw1ykuWnjF2p9/
ikVKVl4Zc2qAB+fCYswBPNAXh+SAMUnSEbQ9lMApo9Owf2WBFfADFtd2q+6CS7kCZRPMIYQl
o8io2sqNyR1KNmRB0DFzeawEbEmupUDvXZjwTB9/wKhcHanahhPczS0/e5uZguEc/LSjISlM
bHfZZ6rbS048j3BUqe91suUGR1R2nv9WM9yZK4IJQ2ATN86mlKPQcAEDB2jdbzYD9HUGKDVl
InJddzq1FbPGLHE3Za5gHQDD9SQ4cHCUasj9hO0SHtG/xeZ2dTEajU5VrlMm02qcE631S4Mf
7pvPtLsePxvnrGX4dN/ff74/vb/JcWSMGvbPMN/hDba4hXRF6gGusS4jMqHXOJCzuVEsRH6m
3EolHTzBoWLs21ptJN1fxGnANpuu0+4/2J/O2diMnWQXYlI33Dy9vQov7lbUPpZPXlfgweHW
OBUrEL9rRRE7Ts2KyTG7FOJ/IBTP48/377YkN3asiBAMxS4gq4wfJgm4cuU652Kj+/r4x9vL
jbRoBaOzphzv2v6W2xdDRYYxox24k/z5ztrm5YbtDGwvfH6F8D9sg+Rf+/Ffru+AB7+cqjdU
dhGXlFUDV1BKE1SNOCEoDOy3lTDHYVoB5cQNa7zMEhsGApHe4wwiBA0PBk97uJmxYfJDNOrE
khjOVpmdaT7s4toPHUDgAhIXoF7hwAgR0Zl1ApOfhhGc6V7rCgK/hj4xOar+s+lyRrSd0yCM
C2ZsEh6wd1gOyn7RiyMMrLz1xPfy5f373zdfHr99Y4Ir/5p17yF0DO6yzqja2vOWrCc+tU+i
IdbO/4JeNg+GVqFWqaqdjJxso3NOzsAptmmeM5/z3BVbZHlOffn1jc04Q5gU2W/YKSptiWub
rAwEG6fijRPOuoFZWUnVI81IBNQRTP6xq3KSSBfjivhk1E5096Gwa63VWSjYGJ/YF2kY+/Tu
YnWB0HNwt4ApHejop6x5uI4jtjRwvO6S2Gofc2qLpuGaHFbx+jwcwwQ7BMumA32rJLJalJFT
9YFfkD/TyeK1VBo5VWhuqD2CtPwSxvSDcbgfDdN2fUxUV+77z4+s2vMYsxxEg9KIFirygOhF
RYq0iCqbg4c/B6a+3WEwTXyTmgdBkpgN11VDO/Tm9O8z1saBWkakLMJsm52vNsuoHbOW7JBk
emHZLnpWhNM77frjzgc5yBLt/N/+71UeyVbBTk0kDhncvrbFOnhlKQayU7caHUmIUZoF8++w
aEkrhy6Ir/ThWKnNg9REreHw9vi/qpYCy0dKkadS3RUW+qA9lixkqIsXuoDECYAfpQKEYaMZ
Vh4fWwL0XCJnYlRlUuVInIUOPBdgDiAF+rCsgaMpQtUaQAXixFGOOHGWIyk9bNHQWfwYGSZy
OChSG4+6nl0wUUVgfTmodlkK8UrHKFCVXlWsB8G4txIO565TD8Uq1Y6KoaE8cB6+YUlhJyvy
6z6Dgzf2DjOrh/JMlTYXmnwwRrVlRJBn5vVhCIKscipaFPn5Rf0WZYJLfwirAVKMF2FmEHM2
MA4iZYCo9MRF9x10bSmaEaF2v1mXYe9w9S2rYeBLc4vYIQy1y7P/TNhXJyegv6qY4Kn47AaL
8Xruioz1k/R/YjbFbK1k1ZMhhoKywQB2K7G387DEEsMlKo2JoKYQc2NWQwf5KLdpEuDDV9WW
nAGQxEhs0/UNZM2Gd4tahSWjMYgcHjyVQvi7MMYOCApLHEcpUlBegxQpKeu6nR9ODkDdXFWA
hI6sYvWsqABhgmU10H2wQ3ISAmiKdvYxOx9LeEwj6Q5vsIVT6pZtMvVj6Dm8b8yl6cd0F2Iv
K0Y4Uf4nk6Q0HVNBlHfDJ8RXViOiSSEKajKWZBEHqrGVQt856QlGp75HfBcQahdeGoQ9Weoc
qTMx6kxQ5fBVM1gFSMkOCbmZFWM86WGjVChATUFVjp3vyHWn249rUIRrXikcsSvXGG/XIYg3
SzrkcUTwAg1d6fBxs7CMU7fV7Fx3BtzQ22UuhggLgQoRSvHiSIV+w7mRwVSFt9dMVT+fgUPs
MyHxgAMJORwxJAzicMDKMpuZbBfmWId+MlAsAwYRb8COBgsHkwgyNGm8OUhO1SnyA6Rlqz3N
SorSu3LCvlSxc5cljpk8YxJjaT/ljk1yZmDCVe8T1InmGtizKdkuhmUvFmX87V3niTdUR3W+
weEHUeNDdWYUDrbDIQsfAES99NQAQhzADp3SHHJohqoc6CziRrk+vpupPJEXYfuQxuKndrk5
ECGbAgApsgDzK4uYEEdhGRZsVRVC9DoWDA4FmAMzjWPn+nQUoWKixpGig1+Ue3Oo0LwLPLzc
Yx6F2MFvXe1zU1ladjtFtU1WGNs7GDVAqdhopTFaX0ZPNj+coPsouCPbToaPf5pgkukKp46v
pdsrEmPYLk4akgARgziwQ7tSQNvLVJcncbA5nYFjR5C504y5uOGpBk0tZMHzkc1FpHsBiLEe
ZgA7cSLrEQCph9S+6XIaq2e8tdSHJEyVxbAznWctnKY/KkR4I7h4sy/ra3fAtcyX7e2aHw6q
O7QFaobuzM5i3dCh5ar6ICRkS75hHIkXIa1S9d0Q7jxkK6iGOkr8AOnNmpLQiyIEgI0nRtZU
CazWmo7tIkhQJVdjvd85ljLifbgEMxZs2xPrYIKMM0B2O0zuhuNjlCCV7aaSbTlICnaE27Ej
OTJoGRIGUYyeGc55kXqor2WVg3jIB6eiK33sew915GMJhtOIbf6MjJ2SGDn4hZJzjFto46ES
My3Z7ok7D5l5SibK7jz8VKrwEN/bWhsZR3RHsOEOvtJ3MUVXxxlLt+RZwbQPMNlhGMcBHXgD
pWz3xg5KuU+SIvETrDzcoRLZ2sk4R4yfllgTJA6Xl+uCkxFvSyABBmwtZfSAYGNlzGN02o4n
mjus8BcW2rHz9Mcs22ODs+AvtArLDvUCozKglaNd6CO716XKoiTKEGD0iY9kdBkTEiD0uySI
4wA5+gGQ+AXWsgClPhbdQuMg7sTbDcpZtiUGxlKzVRV1haHzREZsiBWMSHzCPLzpLOUJOTEr
T6sS4TKIIwDBhinQAF7W2mGo9ppZl+oiElgGqQKppsorHgseTT2jRi5F1W6kmWGdKmx/IENu
F6kkXdvUYnPUVDLp97X7nGZIiYBsMImyQ/B2lHvBtYvMBRjQYDUcXwtv5DgXGIJS5LSxMlYq
hN97ciZTqWw1c/j3X1+fQH3Kae5DD4XljQBocKflOMKCA12hNkLw1Y+nz0aScIMgtLOAhTtm
9dSlmFMxLQye49QRzzJSVRhMlYmVZvhLXemaziZvClNzaiEGGDHBiPrRaCXj+wBvTbh3Q4Nn
LajqFQ6ylDd1VgUk3fRhOyOYiDqDEfKJKLBofugZNKFurrZu7geT2bGSaBd5BrROYoLYtcuG
Ktf8PAGVsRlmLxKsOwaqvsiAMGgOgdnXuDZOTttCN+sB6LaklkGNAvOHSFSaXVFjPCjuJbXB
J55+LKrx2rNQk51NTVLPzgBeZRFiinGmiUEco0C/auHUsjkQf0/x673ygdsyoYZrLLGmhqLQ
waGN+SF2lGUnM1QtQGofGQYjPKNFr0cl8jcggyZUpHTiUOZInkO1i6MJA2ioGwQtRGt9Vhlu
7xPW28ROOGALWbafwrWqS4psD64JtlbT4X7I1ecroGnO6rLCWhLqLkh3uKgk4CR2aAbK3GuK
hTDi3Tmrqs3iSzewc1uoizT8XdDHN5HZS5gjf1upbaWmntUMi46dXgNgTyL8zX5hSNFnKAUm
SCEY1d51FsSw05AYW1wCfMsd72p2gLT7X2WAQGxbA+Su9kkcIOO6pkFozpdFC1Ar42VKnDvI
qlOp79rSl5l72545kDbh+ybBvdfwKtHQOF4ZoG9txUywZsuhM4lcFs0kO+eybwvqK3Wj0pIB
qTMgoed2Mz8Xc6NV8iI1nGUteM8V0zpkIKmWoy6pca6BehdmkhbVIws4VFPJxlBbj+LByWIA
LwJn7h+lGc6aXcPKA56RuN/zTS627x7ZvFbbVgNhU8YGwcqU5WOSRCGeQ1aEQYovjApTw37g
UbYUJjn466LFTu82I5MHQYkLq7QtTyuYIlXbPWbIlzoSEbwRGEbQldFg8dGxkDVhEIYhhpkW
1ytSDXUaoI44NR52qPYzLGfY72K0PBxBm4DrBKFtCgheA7gODpPUBUVxhEG2WKhjYeJKlkS7
FG8xDqIPHzpPqjsuNUCy3eScBx9Aq/jpyjvF7gI1HkMqVjB5cNC3NB3XHMnqEKsXCnVJEqJ9
BxIyPpxN9U0dSdEuNSUkBTmcH0rtklvBLkniRW5IfwU0wBQXtVYuHh0WjNs2+2QVppEsbA0s
i2UgtMt0UVoHB8fNg8IV0iSOtpdwRfK2sfoYmsHbVxTeNHzWo5vZYxKtjhL8yVFnCj3iaMkN
Cdhk0kU1E0UfyQ0mP0DbiWNkt1FJkGc/6Cyn0+penr++KASITrf8XVe9IkL3+ewEVveJC/Gx
FwgtS8UH7ccs0Ucsny4ffmhom/sPebLmvsWYFJZT1neL09svWnLKxJ/bffHRVybabX+jEsqM
2Cf6nNKNxLwrwJGU1hN9rjjddZWqcumezwUyXHEaFbciSyplLos+c0R/hBYd+zKjDxkuk8HX
j23f1efjxieq45nJdS50HFnSytFesy2z0dB2XCsNrfDeZflN+3a6FhfsJoyW4F8E5ERh57ve
B395eX59vHl61xwaracHni7PKL8bFcnxYwZnFIGjruPlH/AW1bEamWz/j5j7DMy5ED69fkWv
1FGvAlsPLOhSFSUPtmuSLruaYDTzFlUgWXFxmnELDnHQoVUD22HWHFXPITzfw13D5tXSMbxP
EGcfoi7gOv/jJoNXiy0uaJHZgnWOnIo/gLFW3WIURnJi7Lw831Ca/w7vOrPTEuVpQcakY83R
U+mSQW2m/flADNFtpSNdwumULS2qmomSgmZ13eZ6oz5+fXp9e3v8/vfqxubnX1/Zz3+xunz9
8Q6/vJIn9te313/d/Pv7+9ef7Bz8Q3FlM0+lfdFfuJukoazL3BpVsDSwwfJlNbstvz69P/Mv
Pb/Mv8lvcuP3d+735M+Xt2/sB/jP+TFb1md/Pb++K6m+fX9/evmxJPzy+ktrZlGA8ZKdC/XV
S5KLLN4F1uhm5DRRNUMkuYRomiEy6DnieO4RHHToAvyaROD5EASqddtMDYNdiFHrgGRW+epL
QLysykmwN7FzkfmBrmcoACZ9xDF2gFnhILWTXToSD7TDxBbBwPf5/XhgB4bF0LwvhqXj1Jks
U2RZZJhac6bL6/PLu5rOXG9iX5e2BbAfEx+PIbrgIR4iZcEjzBhAoLeD56v6cLKX6yS6xFFk
AaxusXHdpgLuZhwvXajFTVDIIZIfA2LPoVMhOe5Iglr1zXCqGf8o1Aij+tY0uXRTQLhivdJ9
MDUftZlrdiRvidiqaT6RUMxFJbeXrxt5kP/n7Mqa20aS9F9hzMNG90PHECBBUrPRD4WDZLVw
GQWQlF8QskzbitbhkOSZ9v76zawCyDqyqN59scX8EnVkZd1ZmUuPmFd+NZdatHSqoshOB0Ty
bO4ISZKvCFVk16vVpTbeipWy8lKd4vbx+HI7jIaa+28J5kDVJkNJWz/cvn6zGZWg7h9hePz3
8fH49HYaRa3CdXW6mE9nARV6QueQfew8Av9TZXD3DDnA8IvHoZ4MsF8vo3BLzJNpM5ETzulT
bZZFmz4lezVj3b/eHWGyejo+o388c2KwxbmcuSpcROHyiugxzlGy5j7h/zFLnV7JW0U0Xq27
X6gJGTF2Xilojiwc1JyB266UR71K+j9e354f7//nOGl3Sr6v9owt+dETW22akugozIKB9A7u
W2Ge2Fahcadkg3qndjPQTxwt9Gq1WnrAjEVWaDMXJu8xNK5C8OnUk3vRhqbthYUtPBWW2MxX
LkBDclKxmIKZp1gYsDzwZH1Iwmm48mFmgDMTm1tHPUZpDjl8GnmC9TqMS/+GZGBL5nOxmvpF
hN2efPjhqk7gqe06mU4DjwQlFvpyl6jnytfNnrxb09iyuVfo6wSmNZ8OrVaNWMCnzsZtyL1j
V17FFTwMIk+v4e1VYF3zamgDk9C7rXfIZ9OgWXu0swjSACQ4Dy/gMVRMGYyOXnWJ4Uofx16P
k3QXT9bj9mOc4drn54dXdIYFM9/x4fn75On4n/MmRR8+fQlJns3L7fdv93ev1I4/bVxffwxo
57n2lIdOVnxJPflFbVaS53rcpPyKDgK/3H/98XKLV4hGCn/rAzXjv8AaYfLpx5cv6GZQK8xQ
7nVMTmnkZ/K7+Pbuz4f7r9/eJv81yZPUDklymj0A65OcCTGcb53bGZF8voa15zxsze4toUKE
q9lmTV5PSYZ2N4umH3b2hzznVyHpPmlEZ/ojTiS2aRXOCzuh3WYTwl6P0TfDyDHu6z15sULM
Flfrjb4OHqoWTYNrI8AQ0reH1UzviUir2gLWxpFuWcmS6xxDMHrkesbPvrzO9o0nUFkpUAaW
JxbKH8GI+e+xzjzy9mOfZymdhPcY+8zC0nq1Mr1MGNCShFwrMaPai9kVhVCGRZosaYskLeFd
FE6Xui/KMxani0C3LtNq0SSHpCz10e29njXyOcPQaS1cdaVmICasH7bnfyTVSWES0oIpz6Iu
tN2nWW2SRPbBUUOkN2xfcD2qPRL/UC53LMoY5svyWQloJURWdJS3r6HkVIW2DUHEiL9o/ylP
EoWJgT73CWtS8fssNPMfTgH7KoceTQdqwXI0VWI48EfiDq31RCZBP4ZROexKe73M4peOl1rV
BB36b3XJfdoVxY1LHkQEWUlPzS4DNp2Ku0FjLnXHGxco6m4+DXorXgoALLla9nghkljNpA5J
LeJQCUNKDO8AfFIiy9LWbGeThPEYTlZFRSOCVaVum3uujNV5QDsKVoaHuVM+rOHgKYjt6Bsc
pcSui9dt+puc2vUJ/0QzVD1loESZPK2FxdzH7PfF3NJgr9Z2xrsFReitg8+R3LHAvGMegYRx
9sGfQb9YG3G0R/KWm+FSkB4naWisgEdmfFa/cMl1lZLELUFuq9IK9TYiOwbtfTDpWOa9U+6R
2iuPnWaXheHPI4XqsN6bCXGBwz+ReNVcCzvlOIsrygu3USK8EJpaUbV0vGUiYaTzBp2rqNrO
LZXbUKJKHIJSdyPMwYiMbrAuTCsygQL7jD25DEDyERYkyzC4Kg5XuE6CIVvaopuqfmZu2mgx
jySXp9YyPs1QFXUK85wMtwVfnl9g8Xs8vt7dPhwnSd2dNhHJ8+Pj85PG+vwdl9mvxCf/0s6n
hrJhgCgmGkJ4iAjGqQohVHzwXC/pCXdpwakFlZGH8OYh6pST76s0nkyVkSohT9Y8dzFeHGTJ
OsNd5EVRGz0lRP8gizBAG05CtXixIYnyQ176saprKUEgXLMGhlPQjarzeMnWmKXUejLQucum
MqWy5KIFTeWViiRVYmAvRqhJ0V73cZvsREoVXlRrGOfqHGbt3JlRRFvc3708Hx+Od2+wo8Wl
o8DdxQQfWqmjdn1HOzbU3//KLqtywDs0m1PWAZWzTY+7KOly6oIUhw+kIMkE23W9Qcto8o3h
KGuMTqLmxNPpJy5BCA9T+qhGLFMklrKu71qeE4qJWLC0Fwtn5OBFFs40q2MeK2iHzfSfr6F4
3eNBAsM1loXAyv8CaBjnn9DreTC1V1cD3XrPfEbmkedt7pklop2NnBkWZjx7HZmTL7dPDNFs
taAKHFnRYE9InkSL0PM+duCJ03D1Lg/sQBNPwISBJRGzKCet6EyOmVt+BRAtoYDIByyoKidi
HuY+V0k6T+Qoq4fvcp2Qg2gTCSzJdkaI9gWkMSyndJpLomMqOq3kA0b2N8QOB6JTDYA3xZnp
D0sD5uToIBHymf6JAW0AqDTRE0Z4cAG52iJ0Sa3CCHrBibpkYhlQigd02wHNCVnNAtKrnsYQ
EjJVdFqkA0Y20qYtFu7WRs4WZVn1zfVsOqMv/k+zMoM16XRFumHQWWDZytz8JRRR46REdOMA
A7gyL67NnJaXhxuVssfbwsgjitVVsMAHMINt2qX6acyDcRpVOFj3B4sV6VlB41iuCP0aALp9
JXhFaPEAXPyKVgsE1aMXGvAniaAvyZlxE2gB3iQl6E0SJEqo1Yj4E5WoL9UoCP/yArYpnw37
jxyQC3oU2YGbfGH6vBjpsJULyKkIEdqJ5rgi3rR55BwpSIRvCpYKYrc5IrTgTmiTbdC4mmDA
S3LYhtY5X3PnRE5yNOth4etZWI6LXJssinA2JWZrBBbUsm4A6FYeQbqeophH1NgDG5VZ6Bw0
jAjtf+7EwGGTS24HWibC6OJCQHKYr6d0aEn7DD1zmM9bdWAZkNWRkMdIT+OBFeWl1ag0GaTm
y3bNrlZLCjib5V0E6XbTGez4ZTbLLCBjRLh8xCjYihkLw6V7MISPo+XqhswasYi+Uht5pOnh
7JJM5ZNMatW6L1aR5QBXQ0if/AYDMQcjfUWMH2joGBCDFdKpwU0aRnr4Z0Q3Q/rcwx/5qriM
Lk/70njzskZLlsvLHWRZXeqqwLCaOsfhZ+SdPezARI5Z+Fh3SvQLSaeb74qacSWdGDCRvvSk
s6Sb9cry+TggH+XhxtWiDi+JChdiy4gYBfClW0S0v6QTBQH6gqpoybpVNCcVBqEV7RRa5wjJ
MVdBF0e+mqFbXxbqB3/maYvxiZo38RaOPFM5w2dAO3JWtyY8dW0Qtlz7An6cwwe0TVZu2q2B
NmyvV7fDJN06YjLn+3V1vvb9eHd/+yDL4JwmIT+bt1liZgYVSLq26lxyo4dPO5F6Pf68pNaW
Qd6JSL6bkagwXVpKWoc3SJ4P4iy/5qX9SZy1VQ3l8X3EN3FWOuVNtlnT3Ng0Dr9u7AySqhHM
W4uk6jassb8pWMLy/IYcvRCvmyrl19kNdUQoU5XWR1bx6jAwDcAkFQTWcnz9H0+he/nSU282
zARBxTZV2XBhNNyZ6hdqVghHolnOSpuSJbr3MUWrLMJHEINJ2mRFzBurr2zWjZXUtsrbzLix
VhSr2Ia0Nu1iNfM1JRSE6ALXN5lJ6BLYgZrmLEjes7wlb4ER3PFsL6rS/Wpz00DzeV7OIQPH
gKieVHlrFe0PFjeW1rR7Xm6Z02uus1JwGHMu5JwnThAXHTXNaRSprHaUdYoEQWbusDNS+/QP
DwA/aiO04AkhtRPRpiviPKtZGiolNT7dXM2nPg1BfL/Nslxc0qGCQesXVSd8zVKAJjSV1RkK
drPOmbDqL582bhxenjSVqNatRa7wSsbuLUWXt3zUW6OgZUttfhXS8I2ZTNXYnQmHKVaif8K8
anxzT52VIIqydb7MWpbfeOLKSgYYa9GsyJMsDCYoQ55YY1bd8IIdbCECa2p1haZKEmYJEIZx
VUmDVoiutIQhrGlAvgm6oBIy2kPOy2tPdUSbMWv0AhLoGczbmVVDKE2ddxaxKbhJ2DRZVjKh
zxEnkjM0i4I17R/VzZDuuVoa/VL1YH7xdWsY8kSWWWN1u4WhpbBVot02nWiV0ZAntQ5XPX0t
ZmZ6Xbj+mDXWxLFnzuSy5xxfKJvEAwcNNUmYmCnjkeKI7uNNCgseu4Mqd579totJegL1RIcL
8pe1TsoHf9njtSaxWDvFAiRXkcpmxZJ4bYazGXjSbEea09ppnx43khniVeWWGxEHHd6TZZCe
qlaYapvwPudtCyvnrISljSZQ7SGsScRo1ZXFCNNObw5e0iYolwHFhS0D+LP0mUxKE6MGZxgm
+m2SGinaCflijMtEyhJGwCTry2w/vp53Lr3NV0DYAIO9htmwgxEcDJ+N4MKSh2M3aBSjajf9
fgsDXM49MbVHrjiXdp+iRQX2coKkhRQ1BlcCgufNtrLUaitYzMNcgBaDObv5PTTTKogAk1IJ
n1/f6MDzZjMulofpFBvJU4ADqpdqQ+NDSU/jDe3K8MShhQA2Ps+GZD3fVocuDKbb2tEeGaIs
WBxcYA3yRxMSB5BO3cOAqkR1uRRdMAupz0S+CoIL3zUrtlhEsG11ygIEy4vuSDX8C49EGe+v
0B6+Y8sqI/1J8nD7+uruQqXSJI68pQ0qOTkguk8LM/O2OO15Sxj2/zWR1W4rWFFlk8/H7/hU
YoI2Uongk08/3iZxfo0dtBfp5PH252hJdfvw+jz5dJw8HY+fj5//e4IhyvWUtseH79I66BHd
K9w/fXm29XPkpFScP95+vX/6qr280Fs9TVb6nYCk4eLPWKag84naelKvaLuz3lN0aRIqfl8R
YAmzF6ytAqMiAKLHY9+QgN92ZNQmBVoe4mTPTUt9Mj+R+g1LN1nrjNcSs8ugC0cqXdok9pcK
eOdDOlMJpeigrqlytxHrh9s3aP3Hyebhx3GS3/48voyaU0hNLxhoxuej4eFBajOv+qr0HALI
PPcJfUo6gLRlg5TTlsOMn1EvX8fhxwiKqRHpwUoC6OwaRWALaGRQ4nOkRPL65Ykyw/UB5RlD
jmdCLMnQVrKnSZNoZ6hThtJAEVaOLpMTWF7DTs9KXYjxJmGxD2yuZ0GwIDH30Eov8XY2p24N
NRY5pW8z1pKp4w03nt1l+WhTTGZTw5xDb8V0rsGvR0GbPWmcWVFn1B28xrJuUw7yrMhS77ix
LtYQXrMPNEDzZ6CRFyo+wj25E9aLuwrCWehJBcCI9OKtqxWDLZq9qB3rtKfpXUfS8VgQNt59
nbJLuKew17l4p67XVcxB1xNao4qkhf2WVxYF7rXf04+iEkvfhaXFtpq/z3boLqw9B6aS7Qqv
TOo8nJExWDSequWLlWlap6EfEta9owEfYMTDHQs9stRJvTpENMbW9LCCQF8z2MalnuEqa2C/
zBvo/frZrs5yU8SVb7x8r1MkN3HWmM+kNPQAI2JF13a/d/Z3g5BrPOukoaLkZUbrJH6WeL47
4C67L+gP91xs46r0iFd0gfl8XG/Nlros0xi6Ol2u1hjeiR6Yh7XQacozN4DkijgruH4TOJBC
a15hadd2B7fYO+Edk/NsU7VmTG9JtlcC4wyQ3CwT0xeAQmWsEv/Un/oOReXOByeE4Y7A3D7j
JVEK6wbYN/pEzmF3Ge821niYO3uetmGwEd/xuEEHhf6SVnvWNLzy7TRwR2O1wxYjtsudzpof
2q4hFkn4kma99yR5A58crDQ/SrkcrCaHPTn+H0bBwTmG2ArY/sMfs8g7nI0s84V+Cy3Fxcvr
HoQs3UwId+29ZZWAucW3x2/tvo5nntZ9iUzngDeEdupdxjY5rGL86nOAfyz81Hnqbz9f7+9u
H9Tym+499VY7GC+rWiWaZHxnlg+Pg/qd8TyoZdtdhSBBUsvi+MZ9nzgud2eDzaZ2uOYpr1GM
cS/i0E5jhyGeARuea3qlqCcBqppn9HMdl5W6idTzBYH18k46JNBhA9yXXdHH3XqNzyZDrfmO
L/ffvx1fQCDnwx6z9caDkS51tnabpvfuOk+nGM5RwoGFS/+St9hdSBPBmX0+g7k4i6I4TS6k
A9NZGC6t7j0Q8QmanZp8W2qf2Jh6RQrS7OQxzMp1JdTdoH0aCn+u/RqBp+D+Y060E/SiWUsH
cJcN2JeJv98rFbpQqnVXJrhsuMBSoAMC4hSG0vcWw8X7D0g3lzx3yrzwObJK60IixFGWddKB
PnKHhrokueqa035JFc6Soi8u9HF1PXgBp81KFJbGm9oaoSSNeCyuge/Ib9Pvs5h+Atre1LoR
qvzZt0ldEDQ95JYiNm2wDALjFlQBa5wxPa7lFMc2nQkxoyNqDzlKl8irk0dA7I3tz+/H3xLl
gPX7w/Gv48s/06P2ayL+c/92943yz6ISLbpDX/OZLF40C73d/v+akV1C9vB2fHm6fTtOiufP
RLAwVZq07lneDge5VknLHZeeYRX+XkE9+RnjdpVnvdjz1ojjVJihbIqkj/MqoW5V0Tfp+Jbf
+ACXNu7ti/Rmqhya+u8ctFSso0wkiXRrRog7Eb23QxpH3q4pjUcO3DY2Zl4tXxe9SE3ipsrT
NRdbq1hG2C0gJPHScLQFpJ30qktId9eB5pF+0gpcRG4TM50OKsMX0HRW+mizhYY3RqeUZflA
yKytxJbHzJaaxlG02pazyAoB2z+CYm6yiuPj88tP8XZ/9yftdHf4qCvlvho2Ol1BxtTBmIlK
74ySC1cXnXz/xn3WqRyyjT1D94npD3kbUPazlSeY0cjYRGQk2DNONRFeWOI135kiL/2kPx+9
7mdqL21YaOMZZIob3AWVuInc7nFLUW6y1BEZsLqDkPxec5ljJizdBFGaekZDqxp2/KORaEWt
l2QV6MGXfJ2wq2jmfjXQfTfMkseMWanKgOG55gQxcqpQR5EMhDFchFsywVCNdESFM+6tFKIL
N8OVFQztXNGIVsETw2J2gWEMjNSytqN1XrIpV0+X8CQI52JKekSVHEQMI6WZaaiCs1sNr2KJ
+FJrE4axGqy02jyJrgLdy6JKy47Jd1LD6K9xlDqrvrxS/PRw//TnL8GvcvZsNrHEoSw/nj7j
tO4ah0x+ORvY/Gp1nhh3+IVdqPwAIrGIGG3JrpOM+uZTtTEoBtmV25f7r1/dvjzYDtijy2hS
YDlGMrAKRpBt1brFGPCUC2pRYPBsM1gdxOrihE7l5P7qvaSSuvMmwmBvsuMtdWxi8BHjwKk2
g9GHlLuU6v33t9tPD8fXyZsS7VklyuPbl3tcXk3upHe9yS/YAm+3L1+Pb7/q84wp64aVgmfl
+zWVMQI85axZqV+cGRhsaw0P/NaHaOdeelDLzw/eZmGUXp6DVM9kDv+WsGwojUO/M1XqNMZ/
Japoc6ksPOlkhxoPTFlyIw9bhJwlO9rjlpN9VlAl7mU4jgL/qtmGm4GlNTaWpkNbkSOgxlm0
24TeFkJ/n2uc7yVUJQ1eYL/DFZeHtveEKMTv++ZwARTcE/jjnAGvK06bIqUY0pe2qQIo7tau
IZW4KRN59nVuC7GXVG0zqz7WG0JRYPuar3ETQbfBwASDS20xDNsgq1Anre4Owxn3uQzbdD5f
6k+60AELEwnn5tF8zRp5iQn9L8t1Mvwcwd+nFrmppAQik6xWZKCnQhjB+hQaV1V7wv7xjxGE
jxr0ARnnfWUaVOsIbUiucThLRz3vc1GGL7SmMm6R8a2q6XcFSTWGcdhkJW8+kMVAnhR6J8Gj
cTD99AEJ0KeTyjBgwbxgP0e4tEQIRkHPmSN+13SCPGUFrFgvQuOd2m7tOWzDYIpU/A4NNsNF
4G8M92tMYQPZt3Ed4BiduVWUR6GBQTpLJNItCrP0gwnk3cvz6/OXt8n25/fjy2+7ydcfR9gv
Ec5+3mMdi7FpshvjJH8g9JnQn9S1zqALy5wspevetCIKp240Bw5Ven0bjLlMP/bs7u4I273n
x+Obtdtj0OmDRTil7XwG1L4CH93qmqmqnJ5uH56/St/B91/v32BtCMsAKIqb73JF+q4AIDDP
sYECK2O6BJdy08szwp/uf/t8/3JUQUZ9JWuXllsNO7/3UhuCDXy/vQO2p7vj3xJHENGGBgAt
53Rx3s9CTUOyjPCfgsXPp7dvx9d7qwBXq//l7GmaE9eV3d9fQc3q3qo5b7ANBhZnYWwDHvw1
liEkG4pJmAk1ScgjpM6Z8+ufWrKNWmoxc98mRN0tWd9qtfpDF/CpqAF9lthKljqP+/Nfx9MP
0Ws//9mfPvaS59f9g6huaOmG4cTzyE/9ZmHNdD/z6c9z7k/ff/bE9IRFkYT4W/ForBtYdzPb
VoCMtrJ/Oz7BDek3xtVljqtHmm6+8qtiOmV2YmG3hpS7H++vkImXtO+9ve7394/IKRlNcalg
s/VIZ+LGlhK8PJyOhwfUIrbgxxQ9UfKoKsCWjBXUixNSrOAJiBxe8xMPWBX1fbL9qHJVqOPt
PMpGriW4cOeV8YpkvxVOXnkmmrMtOEYDJoM+I/OEV5lxhoYSZBX4xRrS29AwcFCxueWBRiCF
c2I7WkTYsKOtUZwBubKEmWvPpis91FBAF1UFPQtamjb61lUi7XHHwBu3X5MCO9sh8DL63VUi
w47QoLDFBmzxV1U6um6rkmgeR6AJQNKVyQDvftKN/u7tx/5MecbXMOqCiNNIPIhb5t+yDMF/
rPUN7EY8AU4D2uRqdUNPoHYziTezoN5ankO/pHNKqp0L3YE8AqslZE65KB3yBcB8beiWeJmU
qo3VDSuTvBGXy63s6Xj/o8eO76f7PRLFt+cqhe8WepCk00IRrYHcugq2GQImRZatwA22DtKC
I87hjDnc9wSyV+6+74VgpQ10h0b7F6T4O+LpQfWl3YIb+52AsXpRFau50oHMm/QlnToAAhqG
NxJDPXUBQVB2OZsz8vl43kMIOeqxQ0bqBHfflpPRyCwLfX1++25K5qsyY2rkd0iKa5oOE472
50LPKBdG6VcIKvVVV2K7u8uloqhC8lDmbfo3+/l23j/3ipde+Hh4/Q+cu/eHb3zwIo0xf+b8
JAeDl1diIlJomQ8O8gdrNhMrY1GcjruH++OzLR+Jl6zcpvx08T375XhKvtgK+RWplB/+T7ax
FWDgBPLL++6JV81adxKvTGJws2E6D98cng4vf2tlNlkaN6rrcKWOOJWj47Z+a+iV/R4i3a5n
VUzd9+NNHV4ErvHfZ87DtVZLxLOdJOcMZyjCBJBbb0tTJXdFTtlmNAQzFkwGOKB3g9EfknR8
G0reXjbYkXlq9PoLXIu3riLGAxKBXzMauB7fvAXXuR7Yr8FU9Xgy8mgZY0PCsuGwT71fNvhW
bw+9AReq/45ERSYguxBqaBSMH7wkGB4sixxehbVsy1kyE1QY3MivOcNBfUv+i06ISx6DVHyV
gdlnR+KqJOzGCGzRgMkSL1Vr4ybQcgpNSqF4+WlBExW0SWVQT+X+JUAWN0otFqkoCKCqFNcA
SCrsWWyaBY4qLuVp18XpQd9I6y4Cp1nI56k0miEqHQUuXppR4FnC1kdZUEV9OlSnwJEujRQ7
cVGHrapquNywCAUtFQCLG0OJQ1203ISfl04fex3OQs8l386zLBgN1M2iAehd1oLpagBWenxS
M4wHpBM9jpkMh05rzajmALg1h7I/ZSLu2xABfFdtBgsDD/tarJdjD/vOAdA00IVC/3/RWzdx
pWNGsIOuA7xWRv2JU1EP1yCeUl2+gUjO93F64mhpV0uPUXowwvn9vpHeisAXnZN5ra4XAnrU
QW7m+1qmkT/e0msFkGNqDgJi4ujlTKgXeRBqqnEVeXrielrWCel9GBCTDV7WE9gG5mVA6u9G
ae7Caa/ccxJ+SqLdb7EZWXaGtA7dwegKjtZfAMwE9akEkfEgOSvQVwP5AsBxUNg+AUEmTQDy
fEucwGAz8R1yCYal56pxrAAwcF0MmDhaWMt8e+eMx1u6g/NgNRqrnkIlXyEH5AIVN4Z1ILVl
kTcIgWFllmwTM4eArwOsTH7BcAQ1ALXA9McOytZCSY/nLXLA+q6yQiXYcR1vbBbl9MfMIdmd
NtuYaQHPGoTvMN+lfSIKCl6sM7yCHk1It6iAzDjbuMEznoPrNBwMVe+Pa373r6YF+MbTerfh
5zfacP/3jwkizGEv1kIhmsjmhvf6xNl/bQ8ee83W1F30OirJ1D/un4V9BpMxcZW8dconYbkw
nLdMs9jHzAekdQZFwBAnE4ZsrLrnTIIv2JKfX31HfeRJElxzVUKCOy+Rp/SSqcn13XiCYpkY
rZKuCA8PDUBIumXcGOwQsGFHJC+KV5mGvnCbF5cvZPkqN5qxpgjWdJe8yLOyzdfV6aIaAMwt
K5t8hpuS9kJoFIGY41r7LI1Do6XhmpFqnnnkrD1DTHAxF+nzf9j30VE+9FRLfEiPcXrgasff
cKA/SKkomt/kqOHEpeWjAkd6vQNMH9fWdweV7q+Xn0KO75Pal/x88j0XlzD29bTO3A/9iY8H
hcNGQ+1uwSGUJ3tA+HqXjXzaly+gJtSZxjkCr68xD+NxnyKN2GCgsmeZ73pqm/nBOXTUkzgs
ByN3iAET9bjkO2sU8FPDBU1GHTwcjhwdNvIcE+Y7yKPp1QnaPWE/vD8//2xkK4qPJ9CPEOZH
8Xoe59qCkB5Ptfh9OkZeNdkVgu6ajJ7eUIX+JYPE7v/3ff9y/7N78fwHNB+jiH0q07SV7Ukp
spDa7s7H06fo8HY+Hb6+d9Fpu2GdDPWYJ0gQbSlCOv943L3t/0g52f6hlx6Pr71/8yr8p/et
q+KbUkV1G5hxZrGPpxcH6TxhU5H/9jOXuLhXewrtW99/no5v98fXfe/NOPTEZb+P9yUAyeAf
mr6CYwlC0YgMyH2C3+crNhii83Pu+EZaP08FTNuNZpuAuZzRJWUOynk1v60KdLnOypXXV+vQ
APTrbnMIyPzBJqH0bJJ6zlniPrX+zI6W5/B+93R+VDiOFno69yppK/NyOONxmcWDgcoaSABS
FAKBX59+wmlQaJMgv6cg1SrKCr4/Hx4O55/KrLmMeOZ6DsVIR4saXwYWwPVaXJAgh3pgXUcq
0y5q5qoctkzj+dLA0GGzqFdqNpaMkOwA0i4aRqPBcuvke8QZdLGf97u399P+ec/Z0HfegYS6
z4AcjQbnG4tsgNnKxMGyFAmxiNgaJGrxbFOw8Ui9CLYQ3FsdFOVeZhtfZVfzNSwTXywTJGNV
Edr6UVCa8EBfYynL/IhtyE3xSperRwx0YhMHk4BeDh2pri4CGlNTOfrMZ6FN0hdEK7htk8Oa
ehCbQBnUMmITT+1+AZloo7pwRhaNJECRopIw81xnrAwOAFRGhKc9NVYDT/v+EC3EeekGJW9J
0O+TIRZbhpml7qSPorAhjBpYQEAcF4tGFCFnanNy3RCUVYEkM59ZwC/O1PW4Kit+L8YRkppq
WcOIp3U1VAXb6ZpviYMQaX/zjZJvq7Y9FFCKGDwvAgfFPinKmg+38omS19/tYxhLHMfDMcI4
ZEDGBquXnucg6eV2tU6YylF2IC32RgfWzsw6ZN7AoZzkC4wqj297tObDOvSV2SQAYw0wGmE5
BUsHQzIQzooNnbGrnMbrME8HfeyARcI8WoSxjrPU75OCbIka4bJS39H1GhvUHR8yPkI0L4a3
CKm5uvv+sj9LaTDBPS3HkxG+uiz7kwkpSWseH7JgrvDYCtDyWCFQFul7MOe7ljJblJUF2eK6
yOI6rjAnlIXe0MXBGJodWXzKxvW0c2ORhUP5ZmgsxAZli6yhUeHQGg2yyjwkx8RwI+QTxhoH
TqtSTI2hHN2LITWSOCF4wwTcPx1ebPNAFZXkYZrkRMcrNPI9b1sVddA4RVJOPuI7ogatqVXv
D1BZfHng17yXvS44aSOqN8Ia6/krPBRUq7KmKBW6GrTEQNELiX/UaXPLZoz+XNMiut7ofvJ6
PPMD/kAqUQ/dEa08GzG+xqltH+7kA/2SPlAPTwlAjkPgns4PPVo6znEOubMBZqhG1BGkfXVN
1mWqM+KWZpNdwrsM85lpVk4cQ8HMUrLMLa+zp/0bsFIkBzQt+34/o3xITbPSxUwqpPW7moBp
506ULvjGTNlkRSXzcIQkxBLEpKnEolRvQ1mZOs5QT+NqNTBsJV+mnsx4GV02tDx9cIQaFanZ
JbVoGiqUFDZKDKpFPURXu0Xp9n0l410ZcN7ONwC4+BbYdnsrT9DH+cL8voCas3mGMW/SPG6p
xyAibmbQ8e/DM1yP+CruPRzepHo8MZ8EWzjUD9l2AidRUIFD8Hi7Jp+Jpw7ibMtEddFfzUBp
H4WZq2ZanKcN/7YlwBSnpeSK63Topf1Nd750fXm1xb+nsd7tZC6boAsg6K9jMcIvypLHwP75
FWRWlqUMUtkJadTMN70k2wo/bkVYrJC3U2X91XGmOH7J0s2k7ztY7CBg9JNYVvbV12aRRvts
zQ8My8QQKJfaMECa4YyH6F2H6oeOT6+VKyFP8KWcYEASIZVyAEmPJHVMvljWUzEPy0KdiwCt
C+xjUVDGFXXBaipieGATxYDlp8XV5TqL1fhSPNmbng4P30llNSCu+f1iQE5zjpwFyxgVddyd
HuiSEqDn91HEk3cZ7QpzkA1sYmlN7BvTzxuY5d0/Hl7NAARgAVoFW06AmCSdXtl6yiBcQndR
d8gYPPnxRF0VaaoqTknMtAozxgeDp0LsaVjiIXLkLQsJh/agds7ev74JBcVL7RtTQeyfbhpm
22WRB8LTX4O69M7iFvyXbd1xngl/fnQfqlRQDNFYoAnLMCgb53Yos3gOly4DLVkVCtXwG1A1
B4PljV4o8JTgIDijH4FxHylZwUKA9tKfhajmPGnzHMMxadm9L5b7E7jtFpv1sxR1UqaG18i6
mRF0C+9istNu4dIqB13/GkOdaZLzictno+1B3DDESab5OkoyylNQFGwas8/LQEQBVmmJ1wCi
dp01skwXScm1oz1IgkFBgkWBuUIXN73zaXcveAJ9jTLVPSRPgFSnBgtSNHMuCP7xbY0R7fuS
oqKVgZ1OxW9JodW1t0JEenyQE1L3TtfKes0WKe8M5ZxS4mUJFldBGvYamxcYliaZFpoEQHJx
hXVFKSGKmxn/P49VL80hBFrCD2ja/iufzw5giSZWmMJ6rAPguTi/xW9qZVAhByAclBRZgOxC
4k3t0l4hOcbbzrAGsCeKLViy2QZhqpUjkCwOVxUt2uckgy2eigK0ghB0nBuBqtizWT87+J3P
Gr42BXS5yhPp7pXqgM/TSGE9IaX7C+MfzqZhEC5ifIAkvNs5zmK689lANYiNQPz5fCEFyJdV
UdNa1Ru1V6wUFW35BagiT5M83rKwsgSIAaKboKJt/gEpOoRoynzGXG2si1DCqItnXbVN1yBo
1HUc73d+/sMimlfSichFoNbSVKt8ywI+zLfmOGvUtrZIbMD4oNZELap4Bh5EkhmqQJ6kZnMv
e45rmwN3RR7LvlCfQpllw5cIfqBk/IoVoYlJdFy8Aa5TX4ESJr2ebYuSqhS4mNgCXjOvB1cn
YK53iyjoesZ5WN1qfsEReBukc4Zw0Kt4WDugOVgEzXSVpHWSg6ZuHoAzZ7JtLC9qOXjt+aoD
EgnQ3CnNAp1OrFQtCRZ5whBK7PWgaKswWOBesyGDVab1rkTYG/plltXbNX2/kjhqOxWlhrUy
LSCs04wN0F4vYQg0E/u0AghXOKJo4xTCMuULPihpcKuhGxv/+8c9ulXMmNhVaW0OSS3Joz+q
IvsUrSNxHF5OQ0U8UUx8v29xfBzN2pXWFk4XKMV1Bfs0C+pPea19rJsQtbZuM8bz0J9ed9RK
7tasEIIWl+CcZeCNKHxSgFkev6b8+eHwdhyPh5M/nA8U4aqeIcXUvCaOpZbHoJsnmey3/fvD
sfeNajaYH6KWCMBS034EGFyo1IkngNBOCByWIF9uAhUukjSqVDWlZVzl6qda3rZJ1llpJKmN
UCI2QV2rYftWc75Up2oBDUjUUZGTxNmsCcirQLsYc/NkHuR1Emq55M9la2/vJWbPdt9JmPRv
JC388WFagYMfO48RRFdwMzsuFruxDbuwZ+QoGVjRcsJeqev0SnXsqLAKMguKfVkFbGFBrjf2
MrMk51PFtoFlV1pf2nFf8s3gKta3Yyvio+0KAT/Y6goTaVj5KbD/4HS60ryfNSTpXdGhaZFD
Szf4XbpF+FuU44H7W3R3rI5IQkymtPF6J5hO/bUSOoIPD/tvT7vz/oNBKC6mRgHYZLoB8pmp
MvF8+a5tA7y6Mverwjb2nKe4Kaqltjm0SO3chvTa1dKensYbpIAhQbCEWKx+KnAoZnPcDjmB
dWic7UU52aKGCDZ4fo/nRLgyUcIgLBc/sUvF9l/9BiVLnlfC8olzg4XCHAObqidla5UP8u4w
o5UCQtecZ6u8KkM9vZ3jpcdB/IoK0O2ymtKKD01OO8MXxuWCnhBhghkPSAsnrIxiAQUWfH7d
cK5U3Jzb0THKuImD5ba8gYON8ukmaFZlyAtTTrrEPFwFTJzEGsy4mF+g1qrLUBbRKitFkCwz
d1cpuhuBprK5p+G8V0B3cmDcy4Irt8YOx/nkCpmYTEqtGAH4xU1e0lwRc+SpumRSZUszWURA
tzzmduChRxuEG3mUTRomwToxCDe2qL5pRPSbv0ZErxmN6Je1Hat6mRrGsbfDp+aiRuJdyU4b
LWhElJKYRuJbKz+xYCaeLc9kaOuKifokizED23fGowHG8IsXzLrt2Notjktaqek0xrAI15nW
Dm2/S73yq3iXrq5Hgwd6JVqEbdBavE+XN6LBExrsGHOrw1C6fohgiItcFsl4WxGwFYZlQQjc
pxrgrQWHcVpjn5gXTF7Hq4oSj3ckVRHUCVnsbZWkqfqM0GLmQUzDqzheUvVIQohARvvE6mjy
VUK9wKLGkxWtV9VSekxChcJdm/xilFIPPas8CWUMDgzY5kWVBWlyJ9TFOje1ijSq2N6gF1L0
ECBt7vb37ydQZTB85jbnpZLaVvGXFQQ8a+XYLS8rQ5PzEQWyKslV4dz0UtTlSb9acfJIwCkx
vBT0NQSoDttosS3490SL8QtKc96BU1cmnmbrKgnpg/vK2dii0N0+WMf8TxXFeSzdOodFeSvY
ohD7lTeIrqC2M17ANMAxJUwq2NsguCclj+QcJwgb5WMX6gzQIAxFIRCdZRGnJanL1wp/Lp0X
qO68WfbnBzCIejj+9fLx5+559/HpuHt4Pbx8fNt92/NyDg8fDy/n/XeYQR+/vn77ICfVcn96
2T/1Hnenh71QGLpMrn9dAmT0Di8H0OY//LNrLLTaaQtPLbwJ4ZLP8Bw1TKCEAJj3veImnRzm
lnjGF7+VtlXtpKvUou0t6ixP9YXUtmZTVFJirspMhUNqLPeSsI06ncQyAAsLKaY8/Xw9H3v3
EHP8eOo97p9eVYM9SQyiceQEDYFdEx4HEQk0SdkyTMpFbNSvQ5hZ4C5AAk3SSlWhucBIQvOS
3lbcWpPAVvllWZrUHGiWABIAk5Rv/cGcKLeBmxnw0wCm7i6v4gHKoJrPHHecrVIDka9SGmh+
vhS/6CIkEeKHuhq37V/VizgPiZxkgKXy/evT4f6PH/ufvXsxcb+fdq+PP435WrHAqGNkTpo4
DAkYSVhFLKDat6rWsTscOhOjrsH7+REUY+935/1DL34RFQYXw38dzo+94O3teH8QqGh33hkt
CMPMHCkCFi74sRm4/bJIb7G9SLfs5glzVEOadoHFX9SYlV1LFwHf4tbt/jAVtqsQeP7NrOPU
7L5wNjVhtTk3Q2ImxqGZN61uDFgxmxJDUfLq2CfahvgeP/pvKqyO0HZaxDmvekW7Rm1ry1iy
NkZ9sXt7tHVXFpj9taCAG9mz+hfXnNb4YHT4vn87mx+rQs8lhgfA5vc25J46TYNl7FJ9LTGk
JKj7Tu30o2RmTmLyU9bpm0UDAkbQJXzixin8mpt7FskFoDcDED4tIrhQuEPaDvlC4ZEWe+0y
WwSOufb4kh36FHjoEGfkIvCI2rOMUr1tkTXnT6bFnMhXzyuHjOLV4G9KWQnJH4hAoOZkDmJz
PXHYtia4hHw1TQjqKhyQU6u4Afev1/ocwsfwqxqlNtVRwI1CE5UquCHxZYBTvuzb8yNmRKaZ
+L1W2eUiuCPDxbQjFaQsUP3LaTs7sXHHJnfFz/9SuuDTJwnVyXV8pe/qmwJ75MXwS7fKCXJ8
fgUzAMRsd10m3kGICqR31CW9QY5x5LQuCy3FuqAXV/Z/eNJpq1ztXh6Oz738/fnr/tT6ZdDc
OXRzlyXbsKxIrZK2ldV03ka+IDDkDi8x1E4oMNSJCQgD+DmBkEcxaBmr90KFK2y8F+sNa1FW
ybpGZuXTO4oqpzabDg3s/7XxE68F9opANSGSj35xeTp8Pe34Het0fD8fXohTF4yzqc1KwOUW
ZCKa802Jv2KlIXFy7V7NLkloVMdUXi+hI/u/yo5sOW7c+J6v8GNSlbgsW9F6H/TAAzNDD0lQ
PDTHC8vRThSVI63Lkrb289MHOMTRoJwHV1noHpAAG303WgTnkUVPohaU5OKori+WUIT+MwLa
4rE8L3XWUeNfGbEjsnFj6YHHwNzgEe5CnKvbWudislUDKl+oe6DcwtuvJRkL0ptgiwIe3nea
QBLoUdincemXn8bob/P4G0+LkdxQeMN3I9nEpJTJjyKNMfYwTAVP+gpT8TO5fCBAxO36cCkn
lFrIdQEsbT9mdY2tKd/C5tSvJdl9O2I71n3mXkBpv11V6nWRjeu9lCmddIeqUuj8I4chdit2
nCwTsBnS0uB0Q+qi7f/54dcxU+heKzJMD/Dzo5tt1n3GrLxbhOIcZ4w5QwFwfpmaZxl4mNCG
N1r8myzPZ+r/+Pxw/8TlS3f/Od19e3i6t2Wd6eBhOVBbL43SRwXehz0Nu15GnpLZfuI1prWn
RZ20B05JXF2fr9GIMfc2KfKrsbmZM3ankTFVdQYyt7U6+WKdjlPZlwJ1KWxtZX2eqYAGWxgM
fWGHMyfQqqhz7IgB64YZrKOi29xm0uxJTuwcR8zOwgSDrGr22Yaj/q1yzKMMjH4Q587QxZWL
ERpV2Vj0w+j+6pOnP9EJNo78yFEiFCBdlR7kKIKDIkV9DELS7gKVDwGpGO0A2JUjgl2BnNld
Tos0NGozy6/hW7FtUue6spY+g+xEIHc0V+H4EcUS6B6lk3B3ZCErjq7K3nYt2RlPM8XiqPW4
87iTfWTNjMPS6+2POOz/Pe7t+/HMGNU/NSFukdhfwQwmbSWN9ZuhSgMA9tMJ502zLzYlmFGf
DA10Xtu4PhaWr9QCpAD4KELKY5WIgP0xPMhClAXM5XzsdKnRtnmURjGE9Fn+AT7PAvVq33cK
z7w0Nm7tqldrPK3E4VXndPsEff82KUe07639Tto2ObD+YwumTmcFtcgYCWEGYaZobu9YTcuh
G8XHUtXrfuPBEFAlDSnqft4pwrir6Hh16bDGc1rqSmPtFCIO9TkWN+N1u0L3peNroknBcohl
uHTrkj+ktTvUHYUjUxabaIax5bqjaeobizevS526fwkcoy69hKLyOPaJfRtUe4MKsTVv1RTO
fVF5UTl/wx9724OKtXwtemt7u+NAh1WL2hclFMjaJaUl5GgoV422693gW3gFVxjBrNcRcXAu
yvfkrhuAmxQIGv3+4+Hp5RsXrT+enu/DmC/J9C01YnY0GR7GNCkxjJhxyiO2hipBVpfn+Mwv
UYyboVD99eX5AxgtKZjh0iKyQ51UxVLWGyh3qUalTrUt4ErFgZxnBf+wk682VQlmL6P7c/ae
PPz39I+Xh0ejFD0T6h2P/wh3k59lLOFgDAgoHzLl1Ila0K4pC1kDsJDyXdKuZF+LhZX2clep
dZ5iQVfRiNa8qikSVQ3onsPyqXkRqxY2l+pQrj9f/PrRpdgGeBmWklaRPGWV5DQxYMkJ0gqL
uzvMN+y9vLzp9DVAoGAQA0pZ1I62yKvuVEYZEVXRVUmfOfkXPoyWgeVtUjYAT8f8kPMbrd7f
k+r8s3TxF7v9lDmh+elfr/fUZ7B4en758Yo32lkUVCVo54AmT4Xu4eA5qs0f6/rDnxcSFnfp
83fJKeKZeP+Qdokpg8Md5mzNOQcZoVKGCv0qKYt1XbFrM2iitbhg98U4szc8F1jlEBhQJnB/
nte2ligvDKQzXp8dyRHgmRGR5JOcao7T6F0t8j4CNrrotF+U5ULGWpvqwvgzZuSjauW2P/P7
YjVhlGRbnSd9MrqCkUE6/aI4pOdNagCivBERV45e48LovqmFh2BS+psPaLOB2EF8GjiPqDKY
Oug3JzQ8bRIu58PSlUM6odoJ2zhM3k5bG7tVE51WqiqBK4SvN0EWPiHntwwo9SSFCThubnAU
WLITA/YmuRXvBeDDQu2QKAcm/J1hY6gkipcqJaSFov6bdHZemwfAMKer1WUZcRGGBh5RbzYf
6/ySDNADlkNKu8Nw4v7Kn472DL6sNxk51C5HVi4a6poYnXhe1ZyxhmlvBF3KHpqZkCePNnxT
CUeBEemd/v3789/f4f3Or99ZXmy+Pt3bqhjwigyzl7Ru7LIVexhL+AfLL8xAPHqwd9cf7K/e
A/2PmwFYS590Ml3ubkAWgkTM/Qaf55sFll6cswlB/v32ikLP5scOTXt18Tzo6kg0Nh27OcFK
mNvdZlz4VqnG48OG5IFZVU2Yp4IrsaTSX5+/PzxhIgUs8vH15fTnCf5zerl7//793+alUAE0
zUvtN4Uyk6bVt0tlzjQDrtFnoC26xsGktEMChormppruSZfRdzuGABfTuybpN+GetLtOVRID
YDC9o3fAqQRGNeFcBhCdDEx4VN67UqnGf1WzTRy9MtKnc5859rDBWH3iirR5kZMZ+GjZRv/H
p3VMs751iq9JQ4R9AHMYA7pAr+yvEvg+C5oFtm8wQHiDfOhUQI58yL6xsvTb15ev71BLukNP
bGBZoFdXIHQcXhI8su3EQKpTL0ByizgsH0dSLTJNF0UGepXDLCLr8J+agSkEamPhXQzMEeBs
kJiJTA6oMOA1W8FlWgiwfyKQKaKgTCSr48xEP154kyBpyIYNQNWNUOUz3+PmLMU7rTfGzGhn
A8M1WekUgDKLIRDRPwvvvtF9U7JyQTWNdKWVdZBgtM4OvbZOYE2XeMKiWk/Mr4aaLaVl6LpN
mo2MMxnsK+88CcBxV/QbdKn4mpYBV6ThAQL67z0UrBWnT4aYoELXgbq2wqj7wRvEhfO0liuP
Hpa5XJacMH5DR2ptQfiO/Ylbjt+Ib40LtiXAn7ycEcSwrvC8l/Oh1LpHap1+IxKn9zFl7wlp
mwsIRoSi+4w7e8hZ1+1Np1ern5ho8WVIL1hA2OyAmgUEZ58m2vCqD/A3Y1eD8rvR0lHi36bA
5eEbgiRfYSMrR6dwYIrS1CXb0ICTusY7fbEvKP3OTU8ycy2sNS23FPikdksx/jPA01IlfJmJ
jZgD5zdlmUjN8bpuMGBoru8NN89Qf1FHhd18Fucgn8Rz56MlBQOnhyUlubNxL+13mb5xnwBj
bwK+PnNm6ylvIltEniu8hSQiLrpDDRyLNwJOcSBxugT73IjFoZOvBT4pXq9WmApb1xXI5SsG
J5CKz5g2IIlF2hF4+VWZrLuQfXBeQY8FsRYvS9rSxHO3tsbtPcT2LPen5xfUqVD/z37/4/Tj
6/3JKh0aPKtzvj1L3HMGqz1tWWzDJ9UEnbt0ofYX9uTZz6lVTxkJEqrMF/mSlGmupa+1zbSd
g82GLhiEMGy2vXGNWABIJA8Ch7g1rJKOHWejnX9WbvNedoySDUqR/E5HbuoilCg0nVRb0pYX
zkuKEasFuB1Oi2I54a+F88YenCic7Yary+WoOC18o/ZI2As7wwEVDjpJR3PC6rLmYN/LwOY/
AHot3a1FYJMP8egMmqCOPxUMA32WcpYdYQxDsQDlGGIcjjcorYClxDFaDMD36A1b2M8kkttL
0CKXElOZSLeVtw+TS8UdpYxDKpPzdq0J9hGzWDaafHe39nZSngds56KYoSlWRVuBJae8mc1N
Q+4lHDDyFs/ilJplHF4kiZE4sVGlHhU6ui+2rXQeEA7IggzUnkUapwyaSOxomiSKALBorHGR
9weVchx6/B9aCYl8uRoCAA==

--xHFwDpU9dbj6ez1V--
